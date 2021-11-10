# ios-juice-maker
iOS 쥬스 메이커 재고관리 

### 프로젝트 만든 사람들

신나 @smart8612 & 제리 @llghdud921

### 프로젝트 기간

2021.10.18 ~ 2021.11.05

---

### 프로젝트 개요

**[Step 1]**

`FruitStore` type 은 과일 을 추가 및 제거해주고 과일 별 보관 양을 관리해주는 역할이다.

`JuiceMaker` 는 사용자에게 주스 주문을 받으면 FruitStore를 통해 받은 과일로 주스를 만들어서 사용자에게 전달하는 역할이다.

**[Step 2]**

초기화면에서 주스주문 버튼을 클릭하면 해당 주스를 만듭니다. 만약 재고가 부족하다면 재고 수정화면으로 이동하여 재고 관리를 진행합니다.

**[Step 3]**

재고 수정화면으로 재고가 부족하거나 수정할 때 사용합니다.

화면 내 stepper를 사용해서 재고를 수정할 수 있습니다.

---

### UML

![Juice Maker diagram-2](https://user-images.githubusercontent.com/40068674/140484056-704ed1fc-a3f6-495b-b13f-6186661d6aa5.png)

---

## [Step 1] JuiceMaker **Type 정의**

### keyword

- MVC Design Pattern
- struct and class
- error handling
- Dictionary
- singleton

---

### 코드를 작성하며 고민했던 부분

- **`FruitStore`가 class인 이유와 `JuiceMaker`가 struct인 이유**
    
    type 을 설계함에 있어서 struct 와 class 를 선택할 때 사용한 기준은 다음과 같습니다.
    
    > Use classes when you need to control the identity of the data you're modeling.
    모델링한 데이터의 identity를 제어하는 경우에는 클래스를 사용해야한다
    - Apple Article ([Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes))
    > 
    
    FruitStore 는 과일들을 저장하는 역할로 모델링 한 데이터를 조작하는 책임을 가진 타입 입니다.
    
    쥬스메이커 앱에서 FruitStore 는 변수나 함수의 인자로 할당될 때 주소값으로 저장되어서 해당 인스턴스를 참조하는 다른 인스턴스가 동일한 데이터를 보고 있다는 것을 보장할 수 있어야 합니다.
    따라서 해당 데이터를 식별할 필요성이 있는 경우로 판단되어 `class` 로 정의하였습니다.
    
    반대로, 구조체는 데이터의 아이덴티티를 제어하지 않기 때문에 local 인스턴스에 대한 변경 사항이 값을 변경할 위험이 없습니다. JuiceMaker는 주스를 만드는 역할로서 데이터의 아이덴티티를 통제하지 않아도 되기 때문에 `struct`로 정의하였습니다.
    
- **에러 처리를 사용해야 되는 상황에 관한 고민**
    
    어느 작업을 처리하는 함수가 문제 상황 대응하지 못해서 상대방(메서드를 호출한 코드)에게 문제 상황을 알려야 하는 경우에 에러 처리가 필요하다고 생각했습니다.
    
    ```swift
    func subtract(fruit: Fruits, of count: Int) {
        ...
        guard let fruitInventory[fruit] >= count else {
            throw Error.outOfStock
            // 과일 개수를 빼주는 해당 함수의 기능을 처리하지 못하고 문제 상황을 알림
        }
    
        fruitInventory[fruit] = numberOfFruit - count
    }
    ```
    
    위와 같은 경우가 아니라면 메서드가 결과값을 반환하도록 해서 좀 더 능동적으로 처리할 수 있도록 에러를 사용하지 않는 방향으로 코드를 구현했습니다.
    
- **Singleton 패턴으로 정의된 class 내부의 init**
    
    초기에 저희 팀은 하기 코드처럼 편의 생성자를 이용해서 파라미터 기본값을 지정해주었습니다.
    
    ```swift
    private convenience init() {
            self.init(defaultStock: 10)
        }
    ```
    
    하지만 SingleTon에서는 Convenience Initializers 와 init 내 파라미터 또한 필요가 없을 것같다는 ~~~~리뷰어의 말씀을 듣고 SingleTon의 내부 동작에 대해 다시 생각해보게 되었습니다.
    
    ```swift
    static var shared: FruitStore = {
        let instance = FruitStore()
            
        return instance
    }()
    ```
    
    static type property로 Singleton을 생성할 수 있으며 클래스 외부에서는 인스턴스 생성시에 파라미터 전달같은 init을 control 할 수 없음을 의미합니다. 따라서 Convenience Initializers는 외부에서 인스턴스 생성시에 편의를 제공하기에 Singleton 패턴의 클래스에서는 사용할 필요가 없음을 알게되었습니다. 
    

---

## [Step 2 - 3] **초기 화면 ,** 재고 관리 기능 **구현**

![스크린샷 2021-11-05 오후 3 03 32](https://user-images.githubusercontent.com/40068674/140484156-902ee3c0-1ebc-46a9-b1c8-e0b4f5758bae.png)

![스크린샷 2021-11-05 오후 5 55 17](https://user-images.githubusercontent.com/40068674/140484304-d9cf9bb8-d3dc-4ffe-aee8-e8a0e85034d3.png)


### keyword

- ViewController & NavigationController
- NotificationCenter
- 데이터 중심의 Programming (데이터 무결성을 위한)
- Customize UI Class

---

### 코드 구현 과정

**Problem** 

`UILabel` 이나 `UIStepper` 같은 View 컴포넌트와 Model 데이터가 동일한 상태를 갖도록 동기화 하는 방법

**Solution**

사용자의 터치를 입력받아 모델을 업데이트하고 업데이트 된 모델을 기반으로 뷰를 업데이트하여 데이터의 흐름을 컨트롤하였습니다. 세부 구현 방식은 다음과 같습니다.

1. UI 컴포넌트를 식별할 수 있는 ID로 Fruit와 Juice 를 갖는 Custom UI 클래스를 정의해주었습니다.
2. ViewController는 View가 로드되는 시점에서 UI 컴포넌트에 연관된 Fruit, Juice를 알 수 있도록 KindOfFruit 값을 부여해줍니다.
3. Model 의 `fruitInventory` 에 있는 모든 재고 현황 데이터를 기준으로 View 를 갱신합니다.
    - FruitStore Model의 Singleton 인스턴스 를 통해 FruitInventory 를 접근하면서 모든 과일에 대한 재고 현황에 접근합니다.
    - 모델에서 찾은 Fruit 종류와 View 의 식별자에 담긴 Fruit, Juice 를 비교해서 동일한 경우 모델의 해당 Fruit의 재고를 해당 View 에 반영했습니다.
4. 사용자가 주스 주문 버튼이나 과일 재고 변경 Stepper 를 사용하여 과일의 재고 현황이 변동되는 경우 Model 은 NotificationCenter를 통해 자신의 정보가 변경되었음을 broadcast 합니다. 
5. broadcast 된 이벤트를 구독하는 View 는 모델에서 다시 값을 불러와서 자신의 정보를 업데이트합니다.
6. 이와 같은 루틴이 반복됩니다.

### 데이터 중심의 Programming

기존의 UIKit에서 사용하는 ViewLifeCycle이나 Segue 방식을 통해 컨트롤러 사이에 데이터를 전달하면 서로 다른 컨트롤러끼리 의존성이 생겨서 특정 이벤트가 발생되지 않을 경우 데이터가 정상적으로 동기화 되지 않거나 데이터를 동기화시키기 위해 매번 View를 갱신하는 메서드를 호출해야 한다는 단점이 존재했습니다.

이점에서 Stepper 는 자신도 값을 가지면서 모델의 값도 변경시키기 때문에 기존의 방식으로 다루기에 까다롭다는 문제점이 있었습니다. Stepper 의 값이 바뀔때마다 모델의 데이터가 바뀌고 바뀐 결과가 항상 Stepper와 일치함을 보장하려면 어떻게 해야하는지 고민하는 View 와 Model 사이에 **데이터 동기화 문제**가 발생하게 된 것입니다.

이 문제를 해결하기위해 데이터를 감시하다가 데이터가 변경되는 것을 기준으로 View 에 데이터의 변동사항을 반영하는 것이 매우 효율적인 방법이라고 생각했습니다.

Stepper 에 위 개념을 적용해본다면 사용자가 Stepper 를 터치하여 값을 변경하면 Model의 재고 현황을 갱신하고 Model이 변경되면 Notification Center 를 통해 이벤트가 발생하게 되며 다시 레이블과 stepper의 값을 갱신하기 때문에 언제나 모델과 Stepper의 값은 일치하게 됩니다. 즉, 동기화 문제에서 벗어날 수 있게되었습니다.

### 고민했던 부분

**Customize UI 클래스를 이용한 View 식별**

`RestorationIdentifier` 를 걷어내고 UIStepper, UILabel , UIButton 을 상속받는 Custom Class에 Fruit와 Juice enum 인스턴스를 담는 프로퍼티를 선언하여 View에 해당하는 데이터를 식별하는 방식을 적용했습니다.

기존에는 String 을 통해 Fruit 혹은 Juice에 해당하는 네이밍 컨벤션을 지정하여 ViewController 에서 String 에 대응되는 Fruit 혹은 Juice enum 인스턴스를 찾도록 구현해두었는데 개선된 방식을 채택하여 String을 비교하는 복잡한 코드를 제거할 수 있었습니다.

**View와 Model의 독립적인 구현**

기존의 구조는 Storyboard View 에서 딸기, 바나나, 파인애플, 키위, 망고 라는 Model 데이터를 갖고 있으면서 순서를 정해주고 있었습니다. 

ViewController가 UI에 알맞는 데이터를 찾아서 갱신하는데 어려운 구조라고 생각했습니다. View에 주어진 데이터를 파악하고 모델 데이터를 파악한 데이터에 맞추어 변환해주는 작업을 수행해야하기 때문입니다.

따라서 스토리보드 상에 보이는 모든 View를 placeholder 처럼 생각하고 ViewController에서 View의 데이터에 해당하는 이모티콘과 id 값을 지정하는 방식으로 개선했습니다. 이 방식을 통해 View에 대한 요구사항이 변화된 경우 ViewController에서 요구사항에 맞춰서 View에 데이터를 담아주면 되기 때문에 View의 재사용성이 향상될 수 있다는 장점을 얻었습니다.
