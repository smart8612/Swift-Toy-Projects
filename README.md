# 🧮 **iOS 계산기 프로젝트**



## 🧐 프로젝트 개요

- iOS 계산기 앱을 구현합니다.

- ARC 규칙에 맞춰 메모리 누수가 발생지 않는`LinkedList` 를 구현합니다.

- `Queue` 자료구조를 활용하여 순차적으로 수식을 처리하는 계산기를 구현합니다.

- `Test-Driven-Development` 를 통해 `UnitTest` 를 진행하며 개발합니다.

  

### 💻 동작 화면

| 계산기 동작 화면                                             | UnitTest 검증 화면                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![CalculatorExample](https://user-images.githubusercontent.com/25794814/143765316-4e4bd3f7-339b-4e15-b9c0-d7dbdfdd16bc.gif) | ![CalculatorUnitTest](https://user-images.githubusercontent.com/25794814/143765462-a9d2f64a-e014-4837-8292-17ef26230144.gif) |



### 🧑🏻‍💻 **참여자**

| 리뷰어                                          | 개발자                                                       | 의존모둠원                                                   |
| ----------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [@AppleCEO](https://github.com/AppleCEO) 도미닉 | [@singularis7](https://github.com/smart8612) 신나            | [@oksunwoo](https://github.com/oksunwoo) Toni                |
| **의존 모둠원 칭찬하기**                        | **Weak1**<br />신나가 토니에게 : 한주간 함께 성장하는 기분을 느낄 수 있었습니다! 남은 시간도 함께 화이팅 해봐요~~~<br />**Weak2**<br />신나가 토니에게 : 이번주가 정말 바쁜 한 주였던 것 같아요 ㅠㅠ… 더 많은 경험을 함께 나누지 못한 것 같아 반성하기도 합니다. 하지만 함께 있는 스크럼 혹은 질문 시간 동안 만큼은 제가 나누고 싶은 지식과 진심이 전달되었다면 좋겠습니다! 지난 2주간 고마웠습니다~ | **Weak1** <br />토니가 신나에게 : 신나에게 질문을 하면 진짜 어디서부터 잘못된지 알수있었어요. 하나부터 열까지 알려주려고 노력해주셔서 감사합니다.<br />**Weak2**<br />토니가 신나에게 : 신나 이번주역시 고생많았어요. 신나 덕분에 함수형 프로그래밍의 개념이 무엇인지 잘 알수가 있었습니다. 진짜 이번프로젝트하면서 신나 덕분에 성장한 것 같아서 고마워요! |



### 📆 **기간**

* **메인 프로젝트 기간**: 2021.11.08 ~ 2021.11.19
* **추가 유지보수 기간**: 2021.11.22 ~ 2021.11.26



### 📖 규칙 (Grounds Rule)

#### 프로젝트에 집중하는 시간

- 평일 오전 10시 30 ~ 저녁 8시 (필요 시 30분 정도 조정 가능)
- 밥먹는 시간 : 1시간 ~ 1시간 30분
- 공식적인 휴일 : 편할때 쉽시다~

#### 의존 모둠원과의 규칙

- 모르거나 새로운 개념을 적용하고 싶을 때 바로 찾아볼 시간을 주세요!
- 매번 스탭이 끝날 때마다 코드 설명해주기!
- 커뮤니케이션을 진행할 때 편하고 적극적으로 표현해주세요!
- PR 보내기 전에 고민했던점 공유하기!

#### Commit 규칙

* 단위 : 함수를 구현, 기능 구현
* 컨벤션 : Karma Style



---



## 🥳 **Achievement**



### [Step 1]

- 연산자와 피연산자를 연산하기 전에 보관할 자료구조로 `Queue` 를 구현하였습니다.
- 삽입 / 삭제를 O(1) 시간복잡도를 갖도록 `LinkedList`를 채택하여 큐를 구현하였습니다.
- UnitTest를 활용한 `TDD` 방식을 접목하도록 시도해보았습니다
- Pull Request : Reviewed By 🍎 [@AppleCEO](https://github.com/AppleCEO) [Step 1 Pull Request Link](https://github.com/yagom-academy/ios-calculator-app/pull/81)



### [Step 2]

- UML Diagram 명세서 구조에 맞춰서 코드를 구현하였습니다.
- 수식을 파싱할 때 `map` `compactMap` `filter` 와 같은 고차 함수를 활용하여 구현하였습니다.
- Pull Request : Reviewed By 🍎 [@AppleCEO](https://github.com/AppleCEO) [Step 2 Pull Request Link](https://github.com/yagom-academy/ios-calculator-app/pull/99) 



### [Step 3]

- ViewController 에서 View 에 관련된 처리만 할 수 있도록 계산기에 관련한 데이터와 로직을 `Calculator` 타입으로 분리하였습니다.

- 모델에 존재하는 계산 데이터의 상태를 View 가 반영하도록 데이터의 흐름을 제어하였습니다.

- [StackView](https://developer.apple.com/documentation/uikit/uistackview)와 [ScrollView](https://developer.apple.com/documentation/uikit/uiscrollview) 를 활용하여 연산 수식을 표현해보았습니다.

- [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter) 를 활용하여 숫자를 특정 형식으로 포맷팅하여 출력시켜보았습니다.

- Pull Request : Reviewed By 🍎 [@AppleCEO](https://github.com/AppleCEO) [Step 3 Pull Request Link](https://github.com/yagom-academy/ios-calculator-app/pull/126)  

  

---



## 🎼 **UML 설계도**



![https://user-images.githubusercontent.com/25794814/141769960-0df5083a-2760-4a3d-9afe-c05527dba6d5.jpg](https://user-images.githubusercontent.com/25794814/141769960-0df5083a-2760-4a3d-9afe-c05527dba6d5.jpg)



---



## 🏆 Process



### [Step 1️⃣] **Queue 타입 구현**



#### Keyword

- Queue
- Linked List
- TDD & UnitTest



#### 고민 했던 부분

- **`CalculatorItemQueue`에서 다루는 Element 에 대하여 `CalculateItem` 프로토콜을 채택한 타입만 사용하도록 구현하는 방법**
  
    1.  `CalculatorItemQueue` 의 Element 타입에  `CalculateItem` 프로토콜을 채택하도록 제약 조건 명시
       
        - Element 의 타입으로 프로토콜을 사용할 경우 Queue로부터 dequeue한 자료를 XCTAssert 를 이용해 비교하기 어렵습니다.
        - 비교 작업은 `Equatable` 을 채택한 타입의 인스턴스 끼리만 할 수 있다는 Xcode 오류가 발생하기 때문입니다.
        - 위 상황에서 문제를 해결하려면 `CalculateItem` 을 준수하는 타입으로 다운 캐스팅해줘야 합니다.
        - 다운 캐스팅  `as?` 이후 옵셔널 바인딩 코드가 들어가기 때문에 복잡해지기 때문에 다른 방법을 강구하게 되었습니다.
        
        ```swift
        let item: CalculateItem = queue.dequeue()
        
        if let item as? String {
          XCTAssertEqual(, )
        } else if let item as Int {
          ...
        }
        ```
        
        
        
    2.  `CalculatorItemQueue` 의 Element 타입으로 `Generic` 을 사용하고 `Type Parameter` 가 `CalculatorItem` 프로토콜을 채택하도록 제약 조건 명시
    
        * 다운 캐스팅 과정 없이도 Queue 에 들어올 Element 타입을 명확하게 알 수 있습니다.
        * Generic 을 사용하면 위 경우 타입에 일부 제약 조건을 명시했지만 타입에 크게 의존하지 않으며 유연하고 재사용성이 좋은 코드를 작성할 수 있습니다.
        * `CalculatorItemQueue`에서 다루는 요소 타입은 반드시 `CalculateItem` 프로토콜을 채택한 타입만 사용할 수 있기 때문에 요구 조건을 충족합니다.
        * Queue 의 Element 타입은 본래 자신의 타입을 유지하고 있기 때문에 Equatable 한 타입이라면 XCTAssert 를 적용하기 쉽습니다.
    
        ```swift
        struct CalculatorItemQueue<Element> where Element: CalculateItem { ... }
        ```
    
    
    
- **Queue 를 구현할 자료구조를 선택하는 접근법** - [CalculatorItemQueue.swift](https://github.com/smart8612/ios-calculator-app/blob/main/Calculator/Calculator/Model/CalculateParser/CalculatorItemQueue.swift)

    * 컴퓨터에서 사용하는 자원을 정량화 할 때 사용되는 시간복잡도와 공간복잡도 개념을 통해 Queue 를 구현하기 적합한 자료구조를 선정해보았습니다.
    * Queue 처럼 동작하는 연산은 첫번째 요소에 접근하고 제거하는 비용이 적고 마지막 요소에 자료를 삽입하는 비용이 적을 수록 유리합니다.

    

    1. Swift Standard Array

        * Swift에서 기본으로 제공하는 컬렉션인 배열의 경우 삽입 삭제시 다음과 같은 시간복잡도를 갖습니다.

        * 기존에 배열이 할당해둔 capacity 범위에서는 O(1) 로 `append` 연산이 이뤄지지만 할당되어있는 capacity를 초과하는 경우 
        * 새로운 공간을 할당해서 값복사가 이뤄지기 때문에 최악의 경우 O(N)의 연산이 발생될 수 있습니다.
        * 앞쪽 데이터를 삭제하는 removeFirst() 혹은 remove 메서드를 사용해도 O(N) 의 시간복잡도가 소요됩니다.
        * 삽입 / 삭제가 자주 이루어지는 큐에서 사용할 자료구조로 사용하기에는 적지 않은 연산 비용을 사용합니다.

        > Arrays increase their allocated capacity using an exponential strategy
        >
        > \- [Apple official document - Array (append)](https://developer.apple.com/documentation/swift/array/3126937-append)

        

    2. Doubly Linked List

        * Head와 Tail 위치를 동시에 기억해두어 리스트의 양끝단에서 삽입 / 삭제를 할 때에 O(1)의 연산 비용으로 구현할 수 있습니다.
        * 앞 뒤에서 삽입 삭제 비용이 때문에 저렴하기 때문에 Queue 를 구현 위한 자료구조로 적합합니다.
        * Singly Linked List 와는 다르게 다음 노드와 이전 노드의 메모리 주소를 함께 기억하고 있기 때문에 노드간의 이동이 자유롭습니다.
        * 연산자의 우선순위를 고려하는 요구사항이 추가 될때 기존 연결리스트 구현을 재사용하여 Stack 자료구조를 구현하기 수월합니다.

        

- **Linked List 를 구성하는 모든 Node가 메모리 누수 없이 Heap 에서 정상적으로 deallocate 되도록 구현** - [LinkedList.swift](https://github.com/smart8612/ios-calculator-app/blob/main/Calculator/Calculator/Model/DataStructure/LinkedList.swift#L94) 
  
    - Swift의 [ARC](https://singularis7.tistory.com/57) 기능은 Class 인스턴스의 strong 참조 횟수가 0보다 큰 경우 메모리의 Heap 에서 유지시키며 참조하는 카운트가 0인 경우 할당된 메모리를 회수합니다.
    - Doubly Linked List 의 경우 두 노드가 서로를 강한 참조하기 때문에 잘못된 방식으로 `deinit` 을 구현할 경우 Strong Reference Cycle 을 발생시킬 수 있습니다.
    - Doubly Linked List 가 사용되지 않을때 Strong Reference Cycle 이 발생되지 않도록 노드 서로가 참조하는 Strong 참조를 끊는 부분을 신경써서 구현했습니다.
    
    
    
- **UML 다이어그램에 표현된 Queue 설계에 담긴 생각**
  
    - `CalculatorQueue` 타입은 제네릭을 통해 구현되었으며 Type Parameter `T `는 반드시 `CalculateItem` 프로토콜을 채택해야합니다.
    - `CalculatorQueue` 타입과 `CalculatorItem` 프로토콜은 서로 의존 관계를 갖기 때문에 점선 화살표로 표현했습니다.
    - `Linked List`는 `Node`의 전체에 해당되는 부분이고 `Node`는 `Linked List`의 부분에 해당되는 구조를 갖습니다. 
    - `Linked List` 내부에서 `Node` 인스턴스를 생성하기 때문에 집합 관계 중 합성 관계를 갖기 때문에 색이 채워진 다이아몬드 화살표로 표현했습니다.
    - `CalculatorQueue` 타입의 `items` 프로퍼티는 `Linked List` 구조로 데이터를 담고 있습니다. 
    - `CalculatorQueue` 타입은 `Linked List` 타입을 사용합니다.
    - `CalculatorQueue`는 `Linked List`를 알고 있지만 반대 방향으로는 알지 못하기 때문에 연관 관계로 정의했습니다.
    
    

#### 개선하고자 노력한 부분

- 테스트 케이스를 정의할 때 메서드 기능 문서화 및 코드 검증 의도를 담은 한글 메서드명으로 정의했습니다.

- 한글 메서드명의 가독성 향상을 위해 `_` 를 활용하여 띄어쓰기를 구분하고 함수의 입출력값을 명확하게 보여주고자 노력했습니다.

- 테스트 케이스의 독립 실행 환경을 구현하기위해 System Under Test (SUT)를 지정하고  `setUpWithError` , `tearDownWithError` 를 통해 초기화시켰습니다.

- early return 방식의 코딩 컨벤션을 채택하여 `else` 의 사용을 줄여보는 시도를 해보았으며 전제를 줄여가는 논리 작성을 할 수 있었습니다.

    ```swift
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



### **Step 2️⃣ : 계산 타입 및 주변 타입 구현**



#### Keyword

* UML
* High Order Function
* Closure



#### 고민 했던 부분

* **UML 차트에 구현된 Type과 Method에 대하여 역할을 구분하고자 고민했습니다.**

  * `Operator`  : 수식에서 연산자에 해당되는 부분을 정의했으며 Operator 의 인스턴스를 통해 calculate 메서드를 호출하여 연산할 수 있습니다.

  * `Double` : CalculateItem 프로토콜을 채택하도록 extension 해주어 CalculatorItemQueue에 Double 형 숫자를 담을 수 있도록 구현했습니다.

  * `Formula` : 수식을 추상화한 타입으로 숫자에 해당하는 부분은 operands, 연산자에 해당하는 부분은 operators 큐에 담기며 결과는 `result` 로 확인할 수 있습니다.

  * `ExpressionParser` : String 타입의 수식을 파싱하여 Formula 타입으로 만들어주며 내부적으로 숫자와 연산자를 `componentsByOperators` 로 파싱합니다.

  

* **Double 자료형을 통해 10진수를 계산했을 때 발생되는 부동소수점 연산 오류**

    * `Double` 자료형을 통해 10진수를 연산할 때 부동소수점 오차에 따른 부정확한 연산이 이뤄졌습니다.

    * 이 문제를 해결하기 위해 10진수로 부동소수점 수를 연산해주는 `Decimal`타입을 활용해보았습니다.
    * 하지만 Decimal 을 Double 로 변환해주는 메서드도 근사치를 반환하는 문제점이 있었습니다.
    * Decimal 을 String 으로 변환하여 Double 로 변환하려고 했지만 format 메서드가 iOS 15 를 최소 타겟으로 하고 있어서 사용하지 않았습니다.
    * 소수점 아래 일정 자리수를 벗어나면 버림 하는 방법으로 우회해서 해결하였습니다.

    > **Decimal**
    > A structure representing a base-10 number.
    >
    > \- [Apple Official Document (Decimal)](https://developer.apple.com/documentation/foundation/decimal)
    ```swift
    extension Decimal {
        var doubleValue: Double {
            NSDecimalNumber(decimal: self).doubleValue
        }
    }
    ```

    

* **0으로 나눴을 때 예외 처리를 하기위한 방법으로 Double.nan 을 비교하지않고 Error를 반환하는 방식을 선택한 고민 과정**

    * Swift의 Double 타입에는 숫자가 아님을 나타내는 `nan` 프로퍼티가 존재합니다.
    * 만약 `Double` 타입의 `nan` 프로퍼티를 통해 처리한다면 Int와 같은 다른 타입과 Double의 `nan` 프로퍼티를 비교할 수 없기 때문에 확장성이 떨어진다고 판단했습니다.
    * Error 정의를 통한 예외 처리를 사용했을때 오류만 던지면 다양한 타입에서도 쉽게 NaN 처리할 수 있다고 판단하여 Error 예외 처리 방식을 선택하했습니다.

    > A NaN compares not equal, not greater than, and not less than every value, including itself. Passing a NaN to an operation generally results in NaN.
    >
    > \- [Apple Official Document (Double.nan)](https://developer.apple.com/documentation/swift/floatingpoint/1641652-nan)

    

#### 개선하고자 노력한 부분

- 테스트 케이스 메서드명에서 서술어를 `오류를 반환하는가` 형태로 작성할 경우 오류를 반환하는 상황이 정상적인지 구분하기 어려운 문제점이 있었습니다.
  
- `오류를 반환하는가`  ->  `오류가 반환되는가`  혹은  `오류가 반환되지 않는가` 의 형태로 반환 결과가 명확한 메서드명을 사용하도록 개선시켰습니다.
  
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
    
    
    
- 상수와 고차 함수를 활용하여  `Expression Parser` 코드를 구현해보았습니다.
  
    * 첫 구현에서는 무조건 Parser 에 수식이 입력될 때 연산자와 피연산자를 띄어쓰기로 구분하여 입력해주도록 구현하였습니다. 
    * ViewController의 데이터를 가공하는 책임이 늘어날 수 있다는 측면에서 좋지 못한 판단이라고 생각했습니다.
    * 따라서 Model 외부에서 별도의 데이터 가공 과정 없이 수식을 넘겨줘도 연산자와 피연산자를 파싱하도록 구현했습니다.
    * 함수형 프로그래밍 사고 방식으로 문제를 해결해볼 수 있도록 상수와 고차 함수를 활용하여 구현해보았습니다.
    
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



### **Step 3️⃣ : 계산기 UI 연동**



#### Keyword

- StackView / ScrollView
- IBOutlet / IBAction
- NumberFormatter



#### 고민 했던 부분

* ViewController 가 많은 역할을 수행하면서 테스트 가능한 코드 구현 및 View 데이터 동기화의 어려움
  * ViewController에 계산기의 Logic 과 Data 가 View 관리 코드와 함께 구현되어 특정 기능에 대한 테스트 진행이 어려운 구조였습니다.
  
    * View 를 업데이트 시켜주고 관리해주는 역할
  
    * 계산기 기능을 동작시키기위한 Logic 을 담당하는 역할
  
    * 계산 과정이나 결과에 따라 갱신되는 수식, 연산자, 피연산자 데이터를 담아 추적하는 역할
  
* 계산기 프로젝트 요구 사항에 명시되지 않았지만 구현되지 않으면 사용자가 불편함을 느낄 수 있는 기능
  * 연산이 완료된 이후에 숫자 버튼 혹은 연산자 버튼을 터치하는 상황
  * 위 경우에서 어떻게 동작하면 User Experience 를 고려하여 사용자가 직관적으로 받아들일 수 있을지 고민했습니다.
  
  

#### 개선 시킨 부분

- 계산기의 상태 Data와 Logic만을 책임지는 `Calculator` 타입 모델을 구현해서 `CalculatorViewController` 로 부터 기능 분리를 진행하였습니다.

  - `CalculatorViewController`가 버튼 Action 이벤트만 처리합니다.
  - 이벤트가 수신된 경우 계산기의 Logic 과 Data 는 `Calculator` 모델을 통해 처리합니다.
  - `CalculatorViewController`는 모델에서 데이터를 받아서 View 에 반영시킵니다.

  

- `Calculator` 모델에 공개 API(예시: `touchNumberButton` ) 메서드를 구현하였습니다.

  - 계산기 앱에서 `숫자` `연산자` `AC` `CE` `=` 과 같이 사용자의 **의도**가 담긴 버튼이 클릭되는 경우가 발생할 수 있습니다.
  - `CalculatorViewController` 는 버튼이 클릭될 때마다 `Calculator` 모델이 사용자 의도에 알맞는 연산을 하도록 모델에게 요청 할 수 있어야합니다.
  - `Calculator` 모델은 발생할 수 있는 사용자 의도(각 버튼이 클릭되는 경우)에 맞춰 현재 연산자, 피연산자, 수학 수식 정보를 갱신하도록 메서드를 구현합니다.
  - `CalculatorViewController` 는 모델에 구현된 메서드를 호출해서 사용자의 의도와 동일하게 모델이 동작할 수 있도록 구현할 수 있었습니다.

  

- 더이상 ViewController가 존재하지 않아도 `Calculator` 모델을 통해 별도로 계산기의 동작을 테스트해볼 수 있게 되었습니다.

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



* `CalculatorViewController` 가 `Calculator` 모델을 관찰하다가 변동사항을 감지하면 View를 갱신하도록 구현했습니다.

  * ViewController 의 UI를 업데이트 코드는 `calculatorModel` 프로퍼티에 붙어있는 property observer가 변화를 감지했을때 실행되도록 구현되었습니다.

  * 이 방식을 선택한 이유는 다음과 같은 세가지 목적이 있습니다.

    - UI 를 갱신하는 메서드가 중복으로 작성되는 경우를 예방하기 위함
    - View 가 연산 결과에 영향을 주는 **상태** 정보를 갖지 않도록 구현하기 위함
    - View가 보여주는 모든 data 의 근원(origin)으로 Model 한 곳으로 부터만 받아오기 위함
    
    ```swift
    private var calculatorModel = Calculator() {
        didSet {
            addCurrentInputToFormulaHistory()
            updateCurrentInputLabel()
            formulaHistoryScrollView.scrollToBottom()
        }
    }
    ```
    
    * **작성한 코드 중 대표 사례** → 연산 결과를 담는 **StackView를 갱신하는 코드**
  
      - StackView가 데이터에 대한 별도의 상태 정보를 갖지 않도록 구현하기위해서 갱신될 때마다 기존에 존재하는 모든 SubView를 지워줍니다.
      - Model로 부터 StackView에 들어가야 할 데이터를 받아와서 StackView 에 반영하도록 구현하고있습니다.
      - Model 에서 View 방향으로 데이터의 흐름을 통제해줌으로써 데이터 동기화 문제가 발생되지 않도록 구현했습니다.
  
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



* ScrollView 가 갱신될 때마다 컨텐츠의 하단부로 이동하는 기능을 구현했습니다.
  * ScrollView 의 하단부로 이동하는 코드의 경우 `CalculatorViewController.swift` 파일 내부에 있는 ScrollView 인스턴스에서만 활용하고 싶었습니다.

  * `fileprivate` 접근제어자를 적용한 `extension` 을 통해 하단 이동 기능을 추가해줬습니다.

  * StackView 가 갱신되는 순간과 ScrollView 가 컨텐츠 크기를 계산하는 순간에 UIkit 상에서 View 를 업데이트 해주는 Cycle을 무시하고 바로 갱신할 수 있도록 `layoutIfNeeded()` 를 사용하였습니다.

  * ScrollView에서 이전 컨텐츠의 하단부로 이동하여 발생되는 스크롤이 밀림 문제점을 해결할 수 있었습니다.

    ```swift
    fileprivate extension UIScrollView {
        func scrollToBottom() {
            layoutIfNeeded()
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
            setContentOffset(bottomOffset, animated: false)
        }
    }
    ```

    

* `=` 버튼이 클릭되어 연산이 완료된 경우에서 새롭게 추가한 기능이 존재합니다.
  * 연산이 완료된 이후 AC 혹은 CE 버튼이 클릭된 경우
    - 새로운 연산이 시작됩니다! 숫자가 기본값인 0으로 설정되어서 사용자가 새로운 수식을 입력할 수 있는 상태가 되었습니다.
  * 연산이 완료된 이후 숫자 버튼이 클릭된 경우
    - 최종적인 연산 결과 숫자값에 이어 새로 입력된 숫자를 추가합니다.
    - 위에서 만들어진 숫자를 초기값으로 갖는 새로운 연산이 시작됩니다.
  * 연산이 완료된 이후 연산자 버튼이 클릭된 경우
    - 최종적인 연산 결과 숫자값을 초기값으로 갖고 연산자가 입력된 후
    - 다음 피연산자를 입력할 수 있는 상태가 됩니다.
