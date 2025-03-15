import Foundation

/*:
 # 알고리즘 문제 풀이
 ## 📌 글자 이어 붙여 문자열 만들기
 주어진 문자열 `my_string`에서 `index_list`에 해당하는 문자들을 순서대로 추출하여 새로운 문자열을 반환하는 문제입니다.
 
 ### 🔹 문제 설명
 - 문자열 `my_string`과 정수 배열 `index_list`가 주어집니다.
 - `index_list`의 원소들은 `my_string`의 인덱스를 나타냅니다.
 - 해당 인덱스의 문자들을 순서대로 이어 붙여 새로운 문자열을 만듭니다.
 
 ### 🔹 제한 사항
 - `1 ≤ my_string.count ≤ 1,000`
 - `1 ≤ index_list.count ≤ 1,000`
 - `0 ≤ index_list[i] < my_string.count`
 */

func solution1(_ my_string: String, _ index_list: [Int]) -> String {
    let char = Array(my_string)  // 문자열을 문자 배열로 변환
    return index_list.map { String(char[$0]) }.joined()
}

/*:
 ## 예제 실행
 */

let my_string1 = "cvsgiorszzzmrpaqpe"
let index_list1 = [16, 6, 5, 3, 12, 14, 11, 11, 17, 12, 7]
solution1(my_string1, index_list1)  // "programmers"

let my_string2 = "zpiaz"
let index_list2 = [1, 2, 0, 0, 3]
solution1(my_string2, index_list2)  // "pizza"

/*:
 ## 설명
 - `Array(my_string)`: 문자열을 배열로 변환하여 문자 인덱싱을 쉽게 만듦
 - `index_list.map { String(char[$0]) }`: 주어진 인덱스의 문자를 문자열로 변환
 - `.joined()`: 모든 문자를 하나의 문자열로 합침
 */

/*:
 ## 📌 잘라서 배열로 저장하기
 문자열 my_str과 n이 매개변수로 주어질 때, my_str을 길이 n씩 잘라서 저장한 배열을 return하도록 solution 함수를 완성해주세요.
 
 ### 🔹 문제 설명
 - 문자열 `my_str`과 매개변수 `n`이 주어짐
 - my_str을 n만큼 잘라서 저장해야 됨
 - 저장한 배열을 다시 return하도록 코드를 작성
 
 ### 🔹 제한 사항
 - 1 ≤ my_str의 길이 ≤ 100
 - 1 ≤ n ≤ my_str의 길이
 - my_str은 알파벳 소문자, 대문자, 숫자로 이루어져 있습니다.
 
 */

func solution2(_ my_str: String, _ n: Int) -> [String] {
    var result: [String] = []
    let length = my_str.count
    
    for i in stride(from: 0, to: length, by: n) {
        let start = my_str.index(my_str.startIndex, offsetBy: i)
        let end = my_str.index(start, offsetBy: n, limitedBy: my_str.endIndex) ?? my_str.endIndex
        result.append(String(my_str[start..<end]))
    }
    
    return result
}

/*:
 ## 예제 실행
 */

//print(solution("abc1Addfggg4556b", 6)) // ["abc1Ad", "dfggg4", "556b"]
//print(solution("abcdef123", 3)) // ["abc", "def", "123"]
//print(solution("helloWorld", 4)) // ["hell", "oWor", "ld"]

/*:
 ## 설명
 - 결과를 저장할 result 배열을 생성
 - stride(from:to:by:)를 사용해서 0부터 my_str.count까지 n간격으로 순회하면서 문자열을 자름
 - 문자열 슬라이싱 (startIndex: 현재 i위치에서 시작하는 인덱스, endIndex: startIndex에서 n만큼 이동, 하지만 문자열 끝을 넘으면 endIndex = my_str.endIndex
 - 잘라낸 문자열을 배열에 추가
 - \* limitedBy: my_str.endIndex를 사용해서 마지막 남은 문자열도 그대로 추가되도록 설정
 */


/*:
 ## 📌 OX 퀴즈
 덧셈, 뺄셈 수식들이 'X [연산자] Y = Z' 형태로 들어있는 문자열 배열 quiz가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.
 ### 🔹 문제 설명
 - 수식이 들어있는 quiz가 배열로 제공
 - 해당 배열의 계산 결과가 맞다면 O, 틀리다면 X를 리턴해야 함
 
 ### 🔹 제한 사항
 - 연산 기호와 숫자 사이는 항상 하나의 공백이 존재합니다. 단 음수를 표시하는 마이너스 기호와 숫자 사이에는 공백이 존재하지 않습니다.
 - 1 ≤ quiz의 길이 ≤ 10
 - X, Y, Z는 각각 0부터 9까지 숫자로 이루어진 정수를 의미하며, 각 숫자의 맨 앞에 마이너스 기호가 하나 있을 수 있고 이는 음수를 의미합니다.
 - X, Y, Z는 0을 제외하고는 0으로 시작하지 않습니다.
 - -10,000 ≤ X, Y ≤ 10,000
 - -20,000 ≤ Z ≤ 20,000
 - [연산자]는 + 와 - 중 하나입니다.
 
 
 */

func solution3(_ quiz:[String]) -> [String] {
    var answer: [String] = []
    
    for q in quiz {
        let parts = q.components(separatedBy: " ")
        let x = Int(parts[0])!
        let y = Int(parts[2])!
        let z = Int(parts[4])!
        
        var result = 0
        
        switch parts[1] {
        case "+":
            result = x + y
        case "-":
            result = x - y
        default:
            break
        }
        
        answer.append(result == z ? "O" : "X")
    }
    
    return answer
}

/*:
 ## 설명
 - 결과를 저장할 answer 변수 선언 (단, 배열을 리턴해야 하므로 빈 배열로 변수를 선언)
 - components(separatedBy: " ")를 사용해서 공백을 기준으로 각 파츠별로 나누고 각각의 파츠별로 숫자는 정수형으로 연산자는 switch case로 계산식을 나눔
 - x에는 0번 인덱스를 가진 파츠를 대입, y에는 2번 인덱스를 가진 파츠를 대입, z에는 4번 인덱스를 가진 파츠를 대입 (!을 사용한 이유는 무조건 값이 있기 때문)
 - 각 케이스 별로 인덱스 1번을 가진 파츠가 + 라면 덧셈 연산자를 실행, 만약 - 라면 뺄셈 연산자를 실행하도록 경우를 나눔
 - 삼항 연산자를 사용해서 정답은 O, 오답은 X를 answer 배열에 추가하기 위해 append를 사용
 - answer를 리턴
 */



/*:
 ## 📌 다음에 올 숫자
 등차수열 혹은 등비수열 common이 매개변수로 주어질 때, 마지막 원소 다음으로 올 숫자를 return 하도록 solution 함수를 완성해보세요.
 ### 🔹 문제 설명
- 배열이 [1, 2, 3, 4] 라면 공차가 1인 등차수열이므로 다음에 올 수는 5이므로 5을 return
- 배열이 [2, 4, 8] 라면 공비가 2인 등비수열이므로 다음에 올 수는 16이므로 16을 return

 
 ### 🔹 제한 사항
 - 2 < common의 길이 < 1,000
 - -1,000 < common의 원소 < 2,000
    - common의 원소는 모두 정수입니다.
 - 등차수열 혹은 등비수열이 아닌 경우는 없습니다.
 - 등비수열인 경우 공비는 0이 아닌 정수입니다.
 
 */

func solution4(_ common:[Int]) -> Int {
    
    if common[1] - common[0] == common[2] - common[1] {
        let difference = common[1] - common[0]
        return common.last! + difference
    } else {
        let ratio = common[2] / common[1]
        return common.last! * ratio
    }
}

/*:
 ## 설명
 - 우선 등차수열인지 등비수열인지 판단하기 위해 common[1] - common[0] == common[2] - common[1] 비교 (해당 식이 성립하면 등차수열, 그렇지 않다면 등비수열)
 - 만약 등차수열이라면 인덱스 1번과 인덱스 0을 뺀 값이 공차이므로 해당 공차를 difference 변수에 대입해주고 return 값으로 common의 마지막 항에 더해줌
 - 만약 등비수열이라면 인덱스 2번과 1번을 나눈 값을 ratio 변수에 대입해주고 return 값으로 common의 마지막 항에 ratio 변수를 곱한 값을 반환
 - 문제 조건에 따르면 등비수열의 공비는 0이 아닌 정수이므로, 나눗셈 연산에서 문제가 발생하지 않음
 - \*common.last!는 배열의 마지막 요소를 가져옴
 */


/*:
 ## 📌 다음에 올 숫자
 - 군 전략가 머쓱이는 전쟁 중 적군이 다음과 같은 암호 체계를 사용한다는 것을 알아냈습니다.
    - 암호화된 문자열 cipher를 주고받습니다.
    - 그 문자열에서 code의 배수 번째 글자만 진짜 암호입니다.
 - 문자열 cipher와 정수 code가 매개변수로 주어질 때 해독된 암호 문자열을 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
- 문자열 cipher가 "dfjardstddetckdaccccdegk" 이고 code가 4로 주어진다면 4, 8, 16, 20, 14번째 글자를 합친 "attack을 return 해야 함
 
 ### 🔹 제한 사항
 - 2 < common의 길이 < 1,000
 - -1,000 < common의 원소 < 2,000
    - common의 원소는 모두 정수입니다.
 - 등차수열 혹은 등비수열이 아닌 경우는 없습니다.
 - 등비수열인 경우 공비는 0이 아닌 정수입니다.
 
 */


 func solution5(_ cipher:String, _ code:Int) -> String {
     return cipher.enumerated()
     .filter { ($0.offset + 1) % code == 0 }
     .map { String($0.element) }
     .joined()
 }

/*:
 ## 설명
 - enumerated()를 사용해서 각 문자에 대해 인덱스를 가져옴
    - \* enumerated()는 Swift에서 각 요소의 인덱스와 값을 함께 가져오는 메서드 (각 요소가 몇 번째 위치에 있는지 알아야 할 때 사용)
 - filter 함수를 통해 code의 배수인 인덱스만 남기기 위해 ($0.offset + 1) % code == 0} 을 작성, offset은 기본적으로 0부터 시작하기 때문에 +1을 해줘서 1부터 시작하는 인덱스로 사용
 - filter로 분류한 것을 String으로 변환해주고 map을 사용해서 하나의 배열로 만듦
 - joined()를 사용해서 필터링된 문자들을 합쳐 최종 문자열을 반환
 */


/*:
 ## 📌 머쓱이보다 키 큰 사람
 - 머쓱이는 학교에서 키 순으로 줄을 설 때 몇 번째로 서야 하는지 궁금해졌습니다. 머쓱이네 반 친구들의 키가 담긴 정수 배열 array와 머쓱이의 키 height가 매개변수로 주어질 때, 머쓱이보다 키 큰 사람 수를 return 하도록 solution 함수를 완성해보세요.

 ### 🔹 문제 설명
- 만약 머쓱이의 키(height)가 140이고 친구들의 키(array)가 [145, 130, 160, 180] 이라면 3을 리턴
 
 ### 🔹 제한 사항
 - 1 ≤ array의 길이 ≤ 100
 - 1 ≤ height ≤ 200
 - 1 ≤ array의 원소 ≤ 200
 
 */
 

func solution6(_ array:[Int], _ height:Int) -> Int {
    let tallerPeople = array.filter{ $0 > height }
    return tallerPeople.count
}


/*:
 ## 설명
 - 우선 머쓱이보다 키가 큰 사람을 분류하기 위해 filter 함수를 사용하고 해당 값을 담을 변수(tallerPeople)를 선언
 - return 값을 tallerPeople로 하고 반환해야 하는 값이 키가 아닌 키 큰 사람의 수이므로 tallerPeople.count로 개수를 반환할 수 있도록 작성
 */


/*:
 ## 📌 모음 제거
 - 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다. 문자열 my_string이 매개변수로 주어질 때 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
- 만약 my_string으로 bus가 주어진다면, u를 제거한 bs를 리턴
 
 ### 🔹 제한 사항
 - my_string은 소문자와 공백으로 이루어져 있습니다.
 - 1 ≤ my_string의 길이 ≤ 1,000
 */


func solution7(_ my_string:String) -> String {
    return my_string.filter { !["a", "e", "i", "o", "u"].contains($0) }
    
}

/*:
 ## 설명
 - filter 함수를 사용해서 a, e, i, o, u가 아닌(!) 요소들을 뽑아서 return
 */

/*:
 ## 📌 치킨 쿠폰
 - 프로그래머스 치킨은 치킨을 시켜먹으면 한 마리당 쿠폰을 한 장 발급합니다. 쿠폰을 열 장 모으면 치킨을 한 마리 서비스로 받을 수 있고, 서비스 치킨에도 쿠폰이 발급됩니다. 시켜먹은 치킨의 수 chicken이 매개변수로 주어질 때 받을 수 있는 최대 서비스 치킨의 수를 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
- 만약 치킨을 100마리 시켰다면 쿠폰 100장이 발급되므로 서비스 치킨 10마리를 주문할 수 있고 서비스 치킨에도 쿠폰이 발급되므로 서비스 치킨 10마리에 + 서비스 치킨으로 받은 쿠폰(10장)으로 치킨 1마리를 더 주문해서 총 11을 return
 
 ### 🔹 제한 사항
 - chicken은 정수입니다.
 - 0 ≤ chicken ≤ 1,000,000
 */


func solution8(_ chicken:Int) -> Int {
    if chicken < 10 {
        return 0
    }
    let service = chicken / 10
    return service + solution8(service + (chicken % 10))
}

/*:
 ## 설명
 - 치킨이 10이 넘지 않는다면 처리할 게 없으므로 0을 return
 - 현재 치킨 수에서 10마리당 1마리씩 서비스 치킨을 받을 수 있으므로 chicken / 10을 계산
 - 현재 서비스 치킨 개수(service)를 더한 후, 재귀 호출을 함
    - 재귀호출 인자는 (service + (chicken % 10))
    - 즉, 현재 서비스 치킨에서 받은 쿠폰과 기존의 남은 쿠폰을 합쳐서 재귀 호출을 함
- \* 재귀를 사용하는 이유는 치킨을 먹으면 쿠폰이 나오고, 쿠폰이 10장이 넘으면 다시 치킨을 받을 수 있는 구조이므로 계속 반복됨 즉, 한 번 치킨을 서비스로 받은 후 그 서비스 치킨에서 또 쿠폰이 나오는 과정을 계속 반복해야 하기 때문에 재귀를 사용
 */




/*:
 ## 📌 가위 바위 보
 - 가위는 2 바위는 0 보는 5로 표현합니다. 가위 바위 보를 내는 순서대로 나타낸 문자열 rsp가 매개변수로 주어질 때, rsp에 저장된 가위 바위 보를 모두 이기는 경우를 순서대로 나타낸 문자열을 return하도록 solution 함수를 완성해보세요.

 ### 🔹 문제 설명
- rsp의 값이 2(가위)라면 0(바위)을 리턴
- rsp의 값이 205(가위 바위 보)라면 052(바위 보 가위)를 리턴
 
 ### 🔹 제한 사항
- 0 < rsp의 길이 ≤ 100
- rsp와 길이가 같은 문자열을 return 합니다.
- rsp는 숫자 0, 2, 5로 이루어져 있습니다.

 */


func Solution9(_ rsp:String) -> String {
    let mapping: [String: String] = ["2": "0", "0": "5", "5": "2"]
    
    return rsp.map { mapping[String($0)] ?? "?" }.joined()
}
    
    /*:
     ## 설명
     - 각 케이스 별로 리턴해야 하는 것이 정해져 있기 때문에 key value 매핑을 사용해서 2는 0, 0은 5, 5는 2로 치환을 해줌
     - rsp의 각 문자에 대해 mapping 딕셔너리를 사용하여 변환하고, 변환된 문자들을 joined()를 사용해서 다시 합쳐서 return
     */
    
    /*:
     ## 📌 짝수의 합
     - 정수 n이 주어질 때, n이하의 짝수를 모두 더한 값을 return 하도록 solution 함수를 작성해주세요.
     
     ### 🔹 문제 설명
     - 만약 n이 10이라면 2 + 4 + 6 + 8 + 10 = 30이므로 30을 return
     
     ### 🔹 제한 사항
     - 0 < n ≤ 1000
     */
    
    func solution9(_ n:Int) -> Int {
        var sum = 0
        for i in 1...n {
            if i % 2 == 0 {
                sum += i
            }
        }
        return sum
    }
    
    /*:
     ## 설명
     - 더한 값을 저장할 변수(sum)를 선언하고 0으로 초기화
     - for문과 if문을 이용해서 1부터 정수 n까지 i 를 2로 나누어서 0이 되는 값들만 sum 변수에 더해줌
     - 해당 값들이 다 더해진 sum 변수를 return
     */


/*:
 ## 📌 마지막 두 원소
 - 정수 리스트 num_list가 주어질 때, 마지막 원소가 그전 원소보다 크면 마지막 원소에서 그전 원소를 뺀 값을 마지막 원소가 그전 원소보다 크지 않다면 마지막 원소를 두 배한 값을 추가하여 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
 - num_list가 [2, 1, 6]라고 주어졌다면 마지막 원소인 6이 그 전 원소인 1보다 크기 때문에 6 - 1인 5를 추가한 [2, 1, 6, 5]를 리턴
 - num_list가 [5, 2, 1, 7, 5]라고 주어졌다면 마지막 원소인 5가 그 전 원소인 7보다 크지 않기 때문에 5의 2배인 10을 추가한 [5, 2, 1, 7, 5, 10]을 리턴

 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 10
 - 1 ≤ num_list의 원소 ≤ 9
 */


func solution10(_ num_list:[Int]) -> [Int] {
    let lastValue = num_list[num_list.count - 1]
    let secondLastValue = num_list[num_list.count - 2]
    var subValue = lastValue - secondLastValue
    
    if lastValue > secondLastValue {
        return num_list + [subValue]
    } else {
     return num_list + [lastValue * 2]
    }
}

/*:
 ## 설명
 - 마지막 원소를 담을 변수(lastValue)와 마지막 원소에서 그 전 원소의 값을 저장할 변수(secondLastValue)를 선언해주고 두 값을 뺀 값을 저장할 변수(subValue)를 선언함
 - if문으로 마지막 원소가 더 크다면 기존 배열(num_list)에 두 값은 뺀 변수를 추가해주고 return
 - 그 외라면 기존 배열에 마지막 원소에 2배를 한 값을 리턴
 */



/*:
 ## 📌 마지막 두 원소
 - 정수가 담긴 리스트 num_list가 주어집니다. num_list의 홀수만 순서대로 이어 붙인 수와 짝수만 순서대로 이어 붙인 수의 합을 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
 - num_list가 [3, 4, 5, 2, 1]로 주어졌다면 홀수만 이어 붙인 수는 351이고 짝수만 이어 붙인 수는 42입니다. 두 수의 합은 393입니다.
 - num_list가 [5, 7, 8, 3]으로 주어졌다면 홀수만 이어 붙인 수는 573이고 짝수만 이어 붙인 수는 8입니다. 두 수의 합은 581입니다.

 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 10
 - 1 ≤ num_list의 원소 ≤ 9
 - num_list에는 적어도 한 개씩의 짝수와 홀수가 있습니다.
 */


func solution11(_ num_list:[Int]) -> Int {
    var oddNum = num_list.filter { (number: Int) -> Bool in
        return number % 2 == 1
    }
    var evenNum = num_list.filter { (number: Int) -> Bool in
        return number % 2 == 0
    }
    
    let oddResult = oddNum.reduce(0) { accumulated, current in
        return accumulated * 10 + current
    }
    
    let evenResult = evenNum.reduce(0) { accumulated, current in
        return accumulated * 10 + current
    }
    
    return oddResult + evenResult
}

/*:
 ## 설명
 - 홀수와 짝수를 별도로 필터링하여 두 배열로 분리함
 - 홀수들을 하나의 숫자로 이어붙임 (예: [1,3,5] → 135)
    - reduce 함수를 사용해 각 숫자를 10의 자리씩 올려가며 계산
 - 짝수들도 같은 방식으로 하나의 숫자로 이어붙임 (예: [2,4] → 24)
 - 두 결과값을 더해서 최종 답을 반환함
 */


/*:
 ## 📌 문자열 앞의 n글자
 - 문자열 my_string과 정수 n이 매개변수로 주어질 때, my_string의 앞의 n글자로 이루어진 문자열을 return 하는 solution 함수를 작성해 주세요.

 ### 🔹 문제 설명
 - my_string은 숫자와 알파벳으로 이루어져 있습니다.
 - 1 ≤ my_string의 길이 ≤ 1,000
 - 1 ≤ n ≤ my_string의 길이

 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 10
 - 1 ≤ num_list의 원소 ≤ 9
 - num_list에는 적어도 한 개씩의 짝수와 홀수가 있습니다.
 */



func solution12(_ my_string:String, _ n:Int) -> String {
    let result = String(my_string.prefix(n))
    return result
}

/*:
 ## 설명
 - prefix 메서드는 앞에서부터 n개의 문자를 가져오기 때문에 prefix를 사용해서 n개 만큼 가져오고 가져온 값을 변수(result)에 담고 해당 변수를 return
 */

/*:
 ## 📌 할 일 목록
 - 오늘 해야 할 일이 담긴 문자열 배열 todo_list와 각각의 일을 지금 마쳤는지를 나타내는 boolean 배열 finished가 매개변수로 주어질 때, todo_list에서 아직 마치지 못한 일들을 순서대로 담은 문자열 배열을 return 하는 solution 함수를 작성해 주세요.
 ### 🔹 문제 설명
- todo_list, finished, result가 각각 ["problemsolving", "practiceguitar", "swim", "studygraph"]    [true, false, true, false]    ["practiceguitar", "studygraph"]
 - todo_list 중에서 "problemsolving"과 "swim"은 마쳤고, "practiceguitar"와 "studygraph"는 아직 마치지 못했으므로 todo_list에서 나온 순서대로 담은 문자열 배열 ["practiceguitar", "studygraph"]를 return 합니다.

 
 ### 🔹 제한 사항
 - 1 ≤ todo_list의 길이 1 ≤ 100
 - 2 ≤ todo_list의 원소의 길이 ≤ 20
    - todo_list의 원소는 영소문자로만 이루어져 있습니다.
    - todo_list의 원소는 모두 서로 다릅니다.
 - finished[i]는 true 또는 false이고 true는 todo_list[i]를 마쳤음을, false는 아직 마치지 못했음을 나타냅니다.
 - 아직 마치지 못한 일이 적어도 하나 있습니다.
 */



func solution13(_ todo_list:[String], _ finished:[Bool]) -> [String] {
    var result: [String] = []
    
    for (index, isFinished) in finished.enumerated() {
        if !isFinished {
            result.append(todo_list[index])
        }
    }
    return result
}

/*:
 ## 설명
 - todo_list와 finished의 인덱스를 이용
 - enumerated()를 사용해서 배열의 각 요소에 대해 인덱스와 요소 값을 함께 제공하는 시퀀스를 반환
 - 만약 finished 배열이 [true, false, true] 라면
    - 첫 번째 반복에서는 index = 0, isFinished = true
    - 두 번째 반복에서는 index = 1, isFinished = false
    - 세 번째 반복에서는 index = 2, isFinished = true
 - if 조건문을 사용해서 isFinished의 값이 false일 때만 내부 코드를 실행
 - todo_list[index]로 현재 인덱스에 해당하는 할 일 항복에 접근
 - 그 항목을 result 배열에 추가한 후 result를 return
 */


/*:
 ## 📌 n보다 커질 때까지 더하기
 - numbers, n, result가 각각 [34, 5, 71, 29, 100, 34], 123, 139로 주어졌다면
 -

 
 ### 🔹 제한 사항
 - 1 ≤ numbers의 길이 ≤ 100
 - 1 ≤ numbers의 원소 ≤ 100
 - 0 ≤ n < numbers의 모든 원소의 합
 */

func solution14(_ numbers:[Int], _ n:Int) -> Int {
    var sum = 0
    for numbers in numbers {
        sum += numbers
        if sum > n {
            break
        }
    }
    return sum
}

/*:
 ## 설명
 - numbers의 합을 저장할 sum 변수 선언
 - for문을 이용해서 numbers를 순서대로 더해주고 sum에 합을 저장
 - if문을 사용해서 sum의 값이 n보다 커지면 중단
 - sum을 return
 */
