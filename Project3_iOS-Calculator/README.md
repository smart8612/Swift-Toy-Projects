## 🧮 **iOS 계산기 프로젝트**

- iOS 계산기 앱을 구현합니다

https://user-images.githubusercontent.com/25794814/143540058-61198ebe-6f3f-4059-9ded-483e62421e38.mp4

### **프로젝트 참여자**

@singularis7

### **리뷰어**

@AppleCEO 도미닉

### **프로젝트 기간**

* **메인 프로젝트 기간**: 2021.11.08 ~ 2021.11.19
* **추가 유지보수 기간**: 2021.11.22 ~ 2021.11.26

---

## **프로젝트 개요**

### **[Step 1]**

- 연산자와 피연산자를 연산하기 전에 보관할 자료구조로 `Queue` 를 구현하였습니다.
- 삽입 / 삭제를 O(1) 시간복잡도를 갖도록 `LinkedList`를 채택하여 큐를 구현하였습니다.
- UnitTest를 활용한 `TDD` 방식을 접목하도록 시도해보았습니다

### [Step 2]

- UML Diagram 명세서 구조에 맞춰서 코드를 구현하였습니다.
- 수식을 파싱할 때 고차 함수 `map` `compactMap` `filter` 와 같은 고차 함수를 활용하여 구현하였습니다.

### [Step 3]

- ViewController 에서 View 에 관련된 처리만 할 수 있도록 계산기에 관련한 데이터와 로직을 별도의 타입으로 분리하였습니다.
- 모델에 존재하는 계산 데이터의 상태를 View 가 반영하도록 데이터의 흐름을 제어하였습니다.
- StackView와 ScrollView 를 활용하여 연산 수식을 표현해보았습니다.
- NumberFormatter 를 활용하여 숫자를 특정 형식으로 포맷팅하여 출력시켜보았습니다.

---

### **Model UML Diagram**

![https://user-images.githubusercontent.com/25794814/141769960-0df5083a-2760-4a3d-9afe-c05527dba6d5.jpg](https://user-images.githubusercontent.com/25794814/141769960-0df5083a-2760-4a3d-9afe-c05527dba6d5.jpg)

---

## [Step 1] **Queue 타입 구현**

### Keyword

- Queue
- LinkedList
- TDD
- UnitTest

### 고민 했던 부분

- `**CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수하기위한 접근법**
    1. `CalculateItem` 프로토콜을 `CalculatorItemQueue`에서 다루는 요소의 타입으로 사용
       
        초기 구현 방법으로 큐 내부의 컬렉션에 `CalculateItem` 타입으로 담아주는 방법을 구현했지만 다음의 어려움이 있었습니다.
        
        - Queue에서 dequeue한 자료를 XCTAssert 를 이용해 비교할 수 없습니다. 비교 작업은 Equatable 을 채택한 타입의 인스턴스 끼리만 비교할 수 있다는 오류를 마주치게 됩니다.
        - 억지로 비교하는 작업을 수행하려면 `CalculateItem` 을 준수하는 다른 타입으로 다운 캐스팅하여 비교해야합니다. 다운캐스팅이 가능한 타입을 `as?` 를 통해 매번 구분해줘야 하기 때문에 코드가 복잡해집니다.
        
        ```
        // Example
        let item: CalculateItem = queue.dequeue()
        
        if let item as? String {
            XCTAssertEqual(, )
        } else if let item as Int {
        
        ```
        
    2. `CalculateItem` 프로토콜을 준수하는 Generic 을 활용한 `CalculatorItemQueue` 요소 타입 사용 CalculateItem 프로토콜을 준수하는 어느 타입으로 Queue 를 활용하여 첫번째 문제를 해결해보았습니다. `CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수한다는 요구조건에 부합하며 다운 캐스팅할 필요없이 자신의 타입을 명확히 알 수 있는 방식이기 때문입니다.
       
        ```
        struct CalculatorItemQueue<Element> where Element: CalculateItem {
            ...
        }
        ```
    
- **Queue 를 구현할 자료구조를 선택하는 접근법**
  
    컴퓨터에서 사용하는 자원을 정량화 할 때 시간복잡도와 공간복잡도 개념을 많이 사용합니다. 현재 프로젝트에서 구현하는 Queue 처럼 동작하는 연산을 구현하려면 첫번째 요소에 접근하고 제거하는 비용이 적고 마지막 요소에 자료를 삽입하는 비용이 적을 수록 유리합니다. 이 기준을 통해 다음의 자료구조를 평가해보았습니다.
    
    1. Swift Standard Array
       
        Swift에서 기본으로 제공하는 컬렉션인 배열의 경우 삽입 삭제시 다음과 같은 시간복잡도를 갖습니다.
        
        기존에 배열이 할당해둔 capacity 범위에서는 O(1) 로 `append` 연산이 이뤄지지만 할당되어있는 capacity를 초과하는 경우 새로운 공간을 할당해서 값복사가 이뤄지기 때문에 최악의 경우 O(N)의 연산이 발생될 수 있습니다.
        
        > arrays increase their allocated capacity using an exponential strategy
        > 
        - [Apple Document - Array (append 메서드 부분)](https://developer.apple.com/documentation/swift/array/3126937-append) >
        
        앞쪽 데이터를 삭제하는 removeFirst() 혹은 remove 메서드를 활용할 경우에도 O(N) 의 시간복잡도가 소요되기 때문에 삽입 / 삭제가 자주 이루어지는 큐에서 사용할 자료구조로 사용하기에는 너무 많은 연산 비용을 사용합니다.
        
    2. Singly LinkedList
       
        데이터의 삽입 / 삭제의 측면에서 더 적은 비용을 사용하기 위해 단방향 연결리스트를 구현해보았습니다. 데이터를 삽입할 때 마지막 노드를 찾아야 하기 때문에 O(N)의 비용이 들지만 첫번째 요소를 삭제하는 측면에서는 head 포인터를 끊어주고 다시 연결해주는 간단한 작업을 해주면 되기 때문에 더 저렴하게 연산을 할 수 있습니다. 하지만 저는 여전히 마지막에 데이터를 삽입하는 경우 O(N)의 비용이 비싸다고 생각했습니다.
        
    3. Doublely LinkedList
       
        시작 위치와 끝 위치를 동시에 기억해둡니다. 단방향 연결리스트와는 다르게 이전 노드의 메모리 주소도 기억하고 있기 때문에 노드간의 이동이 자유롭습니다. 앞 뒤에서 삽입 / 삭제를 할 때에 O(1)의 연산 비용이 들기 때문에 저렴합니다. 따라서 큐의 구현을 위한 자료구조로 적합합니다. 더 나아가 추후 연산 기능을 구현할 때 연산자의 우선순위를 고려하는 구현이 발생할 경우 연결리스트 구현을 활용한 스택 구현에 활용하기에도 좋습니다!
    
- **연결리스트에 담긴 모든 노드가 정상적으로 heap 에서 deallocate 되도록 고민한 접근법**
    - Swift의 ARC 방식은 strong 참조 횟수를 세어서 0보다 큰 경우에는 heap 에서 클래스 인스턴스를 유지시키지만 참조하는 모든 연결고리가 끊어진 경우 (즉, 카운트가 0인 경우) heap에서 할당된 메모리를 회수한다고 가벼운 개념 정도만 잡고 있습니다.
    - 노드를 삭제하거나 LinkedList 자체가 사용되지 않을 경우 모든 노드가 정상적으로 deallocate 되도록 LinkedList를 설계했습니다. 즉, 삭제 연산 등의 메모리를 반환해야 하는 경우가 있다면 노드 간의 참조하는 모든 연결고리를 완벽히 끊어주고자 노력했습니다.
    - 이 과정은 UnitTest를 통해 검증하기가 어려워서 Node 클래스에 deinit 메서드 내부에 print를 호출하여 메모리가 회수되는 과정을 콘솔창을 통해 검증하면서 구현했습니다.
    
- **Queue 설계를 UML 다이어그램으로 표현하기위한 접근법**
    - CalculatorQueue 타입은 제네릭을 통해 구현되어있습니다.
      
        제네릭 타입 T 는 반드시 CalculateItem 프로토콜 타입을 충족하는 타입만 담길 수 있기 때문에 의존관계를 갖는다고 생각하였으며 이를 의미하는 점선 화살표로 표현하였습니다.
        
    - LinkedList는 node의 전체에 해당되는 부분이고 node는 LinkedList의 부분에 해당되는 구조를 갖는다고 생각하였으며 LinkedList 내부에서 Node 인스턴스를 생성하고 있기 때문에 집합관계 중 합성관계를 갖는다고 생가했습니다. 따라서 색이 채워진 다이아몬드 화살표로 표현하였습니다.
    - CalculatorQueue 타입의 items 프로퍼티는 LinkedList 구조로 데이터를 담고 있습니다. 따라서 CalculatorQueue 타입은 LinkedList 타입을 사용하고 있기 때문에 연관관계를 가지며 Queue는 LinkedList를 알고 있지만 LinkedList는 Queue를 알지 못하기 때문에 연관 관계로 정의하였습니다.
    

### 개선하고자 노력한 부분

- 테스트 케이스는 메서드의 기능을 문서화하면서 코드를 검증하고자 하는 의도를 담아 한글명으로 지정했습니다.
- 초기 구현에서는 띄어쓰기를 구분하지 않고 이어서 적었지만 가독성 향상을 위해 `_` 를 활용하여 띄어쓰기를 구분하고 테스트하려는 함수와 입력값 및 출력값을 명확하게 보여주고자 개선해나가고 있습니다.
- 테스트 케이스별 독립적인 실행을 위한 코드의 중복을 피하기 위해 비슷한 테스트들끼리 System Under Test (SUT)를 `setUpWithError` , `tearDownWithError` 를 통해 지정하는 방식으로 구현하고자 하였습니다.
- 이른 `return` 방식의 코딩 컨벤션을 채택하여 else 의 사용을 줄여보고자 시도해보았습니다. 전제를 줄여나가면서 코딩할 수 있는 개선점이 있었습니다.
  
    ```
    @discardableResult
        func removeFirst() -> Element? {
            if isEmpty { return nil }
    
            let firstItem = head?.item
    
            guard let nextPosition = head?.next else {
                tail = nil
                return firstItem
            }
    
            head = nextPosition
            head?.previous = nil
    
            return firstItem
        }
    ```
    

---

## **Step 2 : 계산 타입 및 주변 타입 구현**

### Keyword

- UML
- High Order Function
- Closure

## 고민된 부분

- **UML 차트에 구현된 Type과 Method에 대하여 설계자의 의도를 파악하여 구현하려는 시도**
  
  
    `Operator` 
    
    수식에서 연산자에 해당되는 부분을 정의하였습니다. Operator 의 인스턴스를 통해 calculate 메서드를 호출하여 연산할 수 있습니다.
    
    `Double`
    
    CalculateItem 프로토콜을 채택하도록 기존 Double Type 을 확장합니다. CalculatorItemQueue에 Double 형 숫자를 담을 수 있도록 설정되었습니다.
    
    `Formula` 
    
    하나의 수식을 추상화한 타입입니다. 숫자에 해당하는 부분은 operands, 연산자에 해당하는 부분은 operators 큐에 담깁니다. 연산 결과는 result 메서드를 통해 확인할 수 있습니다.
    
    `ExpressionParser`
    
    String 타입의 수식을 파싱하여 숫자와 연산자를 구분하는 Formula 형태로 만들어줍니다. 내부적으로 componentsByOperators 를 통해 수식을 파싱합니다.
    
- **CalculateItem Type과 CalculatorItemQueue 관계에 있어서 [Step 1] 과의 요구 사항 충돌**
  
    [Step 1] 의 "`CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수합니다." 요구사항이 **CalculateItem** Type과 **CalculatorItemQueue** 사이에 의존성을 갖도록 전제하고 있다고 생각하였습니다.
    
    [Step 2] 요구 사항에서 UML 차트 상에는 두 타입 간에 어떠한 상관 관계도 갖지 않는 것 처럼 보였지만 CaculatorItemQueue 를 필요한 데로 커스텀하여 사용해도 된다는 크루의 글을 기반으로 기존처럼 의존성을 갖도록 구현을 유지시켰습니다.
    
- **Double 자료형을 통해 10진수를 계산했을 때 발생되는 부동소수점 연산 오류**
  
    Double 자료형을 통해 10진수를 연산할 때 부동소수점 오차에 따른 부정확한 연산이 이뤄졌습니다.
    
    이 문제를 해결하기 위해 10진수체계로 부동소수점수를 연산해주는 Decimal 타입을 활용해보았습니다.
    
    > **Decimal**
    A structure representing a base-10 number.
    - [Apple Document](https://developer.apple.com/documentation/foundation/decimal)
    > 
    
    ```swift
    extension Decimal {
        var doubleValue: Double {
            NSDecimalNumber(decimal: self).doubleValue
        }
    }
    ```
    
- **0으로 나눴을 때 Double.nan이 아닌 Error 방식을 선택한 고민 과정**
  
    Swift의 Double 타입에는 숫자가 아님을 나타내는 `nan` 프로퍼티가 존재합니다. 
    
    > A NaN compares not equal, not greater than, and not less than every value, including itself. Passing a NaN to an operation generally results in NaN.
    > 
    
    만약 `Double` 타입의 `nan` 프로퍼티를 통해 0으로 나누는 경우를 처리한다면 CalculateItem 를 채택하는 또 다른 자료형에 대해서는 Double의 `nan` 프로퍼티가 없기 때문에 타입별로 중복된 예외 처리가 구현되야한다고 판단하였습니다.
    
    Error 예외처리를 사용하면 View에서 0으로 나눠졌을 때에 대한 예외 동작 사항만 구현해두고 CalculateItem 입장에서는 연산되는 순간 0으로 나눈 상황이 발생한 경우 사전에 지정된 오류만 던지면 계산기 프로젝트 요구 사항에 적힌 NAN 처리를 쉽게 구현할 수 있을거라 생각하여 Error 를 활용한 예외 처리 방식을 채택하였습니다.
    

### 개선하고자 노력한 부분

- 예외 처리가 포함된 코드를 테스트할 때 "오류를 반환하는가" 형태의 메서드 명을 채택했지만 오류를 반환하는 상황이 참인지 거짓인지 구분하기 어려운 문제점이 존재했습니다.
  
    "오류가 반환되는가" "오류가 반환되지 않는가" 의 형태로 명확한 메서드명을 사용하고자 개선하였습니다.
    
    ```swift
    func test_Double형_80와_Double형_0점0을_divide_operator로_연산하면_divideByZero_오류가_반환되어야한다() {
        // given
        let leftOperand = 80.0
        let rightOperand = 0.0
        
        // when
        do {
            sutDouble = try sutDivideOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch CalculatorError.divideByZero {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    ```
    
- Expression Parser 가 만들어진 과정
  
    첫번째로 구현할 때에는 무조건 Parser 에 수식이 입력될 때 연산자와 피연산자를 띄어쓰기로 구분하여 입력해주도록 구현하였습니다. 이 방법은 ViewController에서 수식을 띄어쓰기로 가공해주는 과정을 거쳐야하기 때문에 ViewController의 책임이 늘어난다는 측면에서 좋지 못한 선택이라고 생각하였습니다.
    
    따라서 ViewController가 띄어쓰기로 구분되지 않은 수식을 넘겨줘도 연산자와 피연산자를 구분하여 파싱할 수 있도록 개선시켰습니다. 
    
    아래는 첫번째로 개선해본 코드입니다. 
    
    ```swift
    private static func componentsByOperators(from input: String) throws -> [String] {
             var operands: [String] = []
             var operators: [String] = []
    
             var defaultOperators: Set<String> = []
             Operator.allCases.forEach { (each: Operator) -> Void in
                 defaultOperators.insert(String(each.rawValue))
             }
    
             var temporaryOperand = ""
             for eachCharacter in input {
                 let convertedCharacter = String(eachCharacter)
    
                 // 마지막이라면
                 if input.last == eachCharacter {
                     temporaryOperand += convertedCharacter
                     operands.append(temporaryOperand)
                     continue
                 }
    
                 // 피연산자에 해당된다면
                 if Double(convertedCharacter) != nil || convertedCharacter == "-" {
                     temporaryOperand += convertedCharacter
                     continue
                 }
    
                 // 연산자에 해당된다면
                 if defaultOperators.contains(convertedCharacter) {
                     operands.append(temporaryOperand)
                     operators.append(convertedCharacter)
                     temporaryOperand = ""
                     continue
                 }
    
                 throw CalculatorError.unknownOperator
             }
    
             return [operands.joined(separator: " "), operators.joined(separator: " ")]
     }
    ```
    
    변수보다는 상수를, 반복문 조건문 보다는 고차함수를 더 활용하여 개선된 코드를 구현해보고 싶어서 다음의 코드로 개선시켜보았습니다.
    
    ```swift
    private static func componentsByOperators(from input: String) throws -> [String] {
            let defaultOperators = Set<Character>(Operator.allCases.map({ (each: Operator) -> Character in
                return each.rawValue
            }))
            
            let operators = input
                .filter({ (each: Character) -> Bool in
                    return defaultOperators.contains(each)
                })
                .map({ (each: Character) -> String in
                    return String(each)
                })
            
            
            let operands = try input
                .map({ (each: Character) -> String in
                    return defaultOperators.contains(each) ? " " : String(each)
                })
                .joined().components(separatedBy: " ")
                .map { (each: String) -> String in
                    guard let _ = Double(each) else {
                        throw CalculatorError.unknownOperator
                    }
                    return each
                }
            
            return operands + operators
        }
    ```

---

## **Step 3 : 계산기 UI 연동**

### Keyword

- StackView / ScrollView
- IBOutlet / IBAction
- NumberFormatter

## 고민한 부분

* ViewController 가 많은 역할을 수행하면서 테스트 가능한 코드를 작성하는데 어려워졌던 부분
  * 초기 ViewController 를 구현에서는 계산기의 Logic 과 Data 가 View 관리 코드와 함께 섞여 있어서 특정 기능에 대해 TDD 접목을 통한 테스트 코드를 작성하기 어려운 구조로 작성되었습니다.
* 요구 사항에 명시되지 않았지만 구현되지 않으면 사용자가 불편함을 느낄 수 있는 부분
  * 연산이 완료된 이후에 숫자 버튼을 클릭하였을 때, 연산자 버튼을 터치하였을 때 어떻게 동작하면 사용자가 직관적으로 받아들일 수 있을지 고민해보았습니다.

## 개선 시킨 부분

`CalculatorViewController`가 View를 통제하고 모델 데이터를 반영하는 역할만 수행하도록 기능 분리를 진행하였습니다.

- 기존에는 ViewController가 다음과 같은 3가지의 역할을 동시에 수행하고 있어서 코드 구현부가 복잡하고 TDD 접목이 어려운 문제점이 존재했습니다.

  - View 를 업데이트 시켜주고 관리해주는 역할
  - 계산기 기능을 동작시키기위한 Logic 을 담당하는 역할
  - 계산 과정이나 결과에 따라 갱신되는 수식, 연산자, 피연산자 데이터를 담아 추적하는 역할

- 위 문제를 해결하기위해서 계산기의 상태 데이터와 Logic만을 책임지는 `Calculator` 모델 타입을 별도로 구현했습니다.

  - `CalculatorViewController`가 계산기에 버튼을 클릭할 때에 대한 logic 그리고 수식과 같은 data 를 `Calculator` 모델을 통해 처리하도록 분리하였습니다.

- `Calculator` 모델에 공개 API(예시: `touchNumberButton` ) 메서드를 구현하였습니다.

  - 계산기 앱에서 `숫자` `연산자` `AC` `CE` `=` 과 같이 사용자의 **의도**가 담긴 버튼이 클릭되는 경우가 발생할 수 있습니다.
  - `CalculatorViewController` 는 버튼이 클릭될 때마다 `Calculator` 모델이 사용자 의도에 알맞는 연산을 하도록 모델에게 요청 할 수 있어야합니다.
  - `Calculator` 모델은 발생할 수 있는 사용자 의도(각 버튼이 클릭되는 경우)에 맞춰 현재 연산자, 피연산자, 수학 수식 정보를 갱신하도록 메서드를 구현합니다.
  - `CalculatorViewController` 는 모델에 구현된 메서드를 호출해서 사용자의 의도와 동일하게 모델이 동작할 수 있도록 구현할 수 있었습니다.

- 더이상 ViewController가 존재하지 않아도 `Calculator` 모델을 통해 계산기의 동작을 테스트해볼 수 있게 되었습니다.

  - Calculator 에 구현된 메서드를 호출함으로써 사용자의 의도가 담긴 이벤트가 호출된 경우를 가정하여 테스트를 진행하고 결과값을 확인할 수 있게 되었습니다.

  ```swift
  func test_10_나누기_0_클릭후_연산_버튼을_클릭하면_NaN을_반환해야한다() {
      // given
      sutCalculator.touchNumberButton(Buttons.one)
      sutCalculator.touchNumberButton(Buttons.zero)
      sutCalculator.touchOperatorButton(Buttons.divide)
      sutCalculator.touchNumberButton(Buttons.zero)
      sutCalculator.touchEvaluateButton()
  
      // when
      let result = sutCalculator.currentInputOperand
  
      // then
      XCTAssertEqual(result, "NaN")
  }
  ```

`CalculatorViewController` 가 `Calculator` 모델을 관찰하다가 변동사항을 감지하면 View를 갱신하도록 구현했습니다.

- ViewController 내부에 구현된 UI를 업데이트 해주는 코드는 `calculatorModel` 프로퍼티에 붙어있는 property observer가 변화를 감지했을때 실행되도록 구현되어있습니다.

  ```swift
  private var calculatorModel = Calculator() {
      didSet {
          addCurrentInputToFormulaHistory()
          updateCurrentInputLabel()
          formulaHistoryScrollView.scrollToBottom()
      }
  }
  ```

- 이 방식을 선택한 이유는 다음과 같은 세가지 목적이 있습니다.

  - UI 를 갱신하는 메서드가 중복으로 작성되는 경우를 예방하기 위함
  - View 가 연산 결과에 영향을 주는 **상태** 정보를 갖지 않도록 구현하기 위함
  - View가 보여주는 모든 data 의 근원(origin)으로 Model 한 곳으로 부터만 받아오기 위함

- **작성한 코드 중 대표 사례** → 연산 결과를 담는 **StackView를 갱신하는 코드**

  - StackView UI가 데이터에 대한 상태 정보를 갖지 않도록 구현하기위해서 UI가 갱신될 때마다 기존에 StackView에 존재하는 SubView를 지우고 다시 Model로 부터 데이터를 받아와서 StackView 에 추가하도록 구현하고있습니다.

  ```swift
  private func addCurrentInputToFormulaHistory() {
      removeAllFormulaHistory()
      calculatorModel.mathExpression.forEach { eachForm in
          let stackView = UIStackView()
          stackView.spacing = 8.0
          
          let operatorSignLabelView = UILabel()
          operatorSignLabelView.text = eachForm.operatorSymbole
          operatorSignLabelView.textColor = .white
          
          let operandLabelView = UILabel()
          operandLabelView.text = formatNumberForStackView(eachForm.operandNumber)
          operandLabelView.textColor = .white
          
          stackView.addArrangedSubview(operatorSignLabelView)
          stackView.addArrangedSubview(operandLabelView)
          
          formulaHistoryStackView.addArrangedSubview(stackView)
      }
  }
  ```

ScrollView 가 갱신될 때마다 컨텐츠의 하단부로 이동하는 기능을 구현했습니다.

- ScrollView 의 하단부로 이동하는 코드의 경우 `CalculatorViewController.swift` 파일 내부에 있는 ScrollView 인스턴스에서만 활용하고 싶어서 다음과 같이 `extension` 을 활용하여 기능을 추가해줬습니다.

  ```swift
  fileprivate extension UIScrollView {
      func scrollToBottom() {
          layoutIfNeeded()
          let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
          setContentOffset(bottomOffset, animated: false)
      }
  }
  ```

- ScrollView의 컨텐츠에 해당하는 StackView 가 갱신되는 순간과 ScrollView 가 컨텐츠 크기를 계산하는 순간에 UIkit 상에서 View 를 업데이트 해주는 Cycle을 무시하고 바로 갱신할 수 있도록 도와주는 메서드인 `layoutIfNeeded()` 를 사용하여 스크롤이 한칸씩 밀리는 문제점을 해결하였습니다.

= 버튼이 클릭되어 연산이 완료된 경우에서 추가한 기능이 존재합니다.

- 연산이 완료된 이후 AC 혹은 CE 버튼이 클릭된 경우
  - 새로운 연산이 시작됩니다! 숫자가 기본값인 0으로 설정되어서 사용자가 새로운 수식을 입력할 수 있는 상태가 되었습니다.
- 연산이 완료된 이후 숫자 버튼이 클릭된 경우
  - 최종적인 연산 결과 숫자값에 이어 새로 입력된 숫자를 추가합니다.
  - 위에서 만들어진 숫자를 초기값으로 갖는 새로운 연산이 시작됩니다.
- 연산이 완료된 이후 연산자 버튼이 클릭된 경우
  - 최종적인 연산 결과 숫자값을 초기값으로 갖고 연산자가 입력된 후
  - 다음 피연산자를 입력할 수 있는 상태가 됩니다.
