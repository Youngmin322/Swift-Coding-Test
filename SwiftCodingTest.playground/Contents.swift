import Foundation

/*:
 # 알고리즘 문제 풀이
 ## 📌 글자 이어 붙여 문자열 만들기
 MARK: 글자 이어 붙여 문자열 만들기
 
 - 주어진 문자열 `my_string`에서 `index_list`에 해당하는 문자들을 순서대로 추출하여 새로운 문자열을 반환하는 문제입니다.
 
 
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
 MARK: 잘라서 배열로 저장하기
 
 - 문자열 my_str과 n이 매개변수로 주어질 때, my_str을 길이 n씩 잘라서 저장한 배열을 return하도록 solution 함수를 완성해주세요.
 
 
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
 MARK: OX 퀴즈
 
 - 덧셈, 뺄셈 수식들이 'X [연산자] Y = Z' 형태로 들어있는 문자열 배열 quiz가 매개변수로 주어집니다. 수식이 옳다면 "O"를 틀리다면 "X"를 순서대로 담은 배열을 return하도록 solution 함수를 완성해주세요.
 
 
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
 MARK: 다음에 올 숫자
 
 - 등차수열 혹은 등비수열 common이 매개변수로 주어질 때, 마지막 원소 다음으로 올 숫자를 return 하도록 solution 함수를 완성해보세요.
 
 
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
 MARK: 다음에 올 숫자
 
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
 MARK: 머쓱이보다 키 큰 사람
 
 
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
 MARK: 모음 제거
 
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
 MARK: 치킨 쿠폰
 
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
 MARK: 가위 바위 보
 
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
 MARK: 짝수의 합
 
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
 MARK: 마지막 두 원소
 
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
 ## 📌 홀수 vs 짝수
 MARK: 홀수 vs 짝수
 
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
 MARK: 문자열 앞의 n글자
 
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
 MARK: 할 일 목록
 
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
 MARK: n보다 커질 때까지 더하기
 
 ### 🔹 문제 설명
 - numbers, n, result가 각각 [34, 5, 71, 29, 100, 34], 123, 139로 주어졌다면
 - 29를 더한 뒤에 sum 값은 139이고 'n' 값인 123보다 크므로 139를 return 합니다.
 
 
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


/*:
 ## 📌 카운트 업
 MARK: 카운트 업
 
 - 정수 start_num와 end_num가 주어질 때, start_num부터 end_num까지의 숫자를 차례로 담은 리스트를 return하도록 solution 함수를 완성해주세요.
 
 
 ### 🔹 문제 설명
 - start_num이 3이고 end_num이 10이라면 [3, 4, 5, 6, 7, 8, 9, 10]을 담은 배열을 return
 
 
 ### 🔹 제한 사항
 - 0 ≤ start_num ≤ end_num ≤ 50
 */

func solution15(_ start_num:Int, _ end_num:Int) -> [Int] {
    return Array(start_num...end_num)
}

/*:
 ## 설명
 - start_num...end_num으로 시작 숫자부터 끝 숫자까지의 닫힌 범위를 생성
 - Array()는 이 범위를 배열로 반환하므로 Array(start_num...end_num) 을 return
 */


/*:
 ## 📌 카운트 다운
 MARK: 카운트 다운
 
 - 정수 start_num와 end_num가 주어질 때, start_num에서 end_num까지 1씩 감소하는 수들을 차례로 담은 리스트를 return하도록 solution 함수를 완성해주세요.
 
 
 ### 🔹 문제 설명
 - start_num이 10이고 end_num이 3이라면 [10, 9, 8, 7, 6, 5, 4, 3]을 return
 
 
 ### 🔹 제한 사항
 - 0 ≤ end_num ≤ start_num ≤ 50
 */


func solution16(_ start_num:Int, _ end_num:Int) -> [Int] {
    var a: [Int] = []
    
    for i in end_num...start_num {
        a.append(i)
    }
    return a.reversed()
}


/*:
 ## 설명
 - for문을 사용해서 end_num부터 start_num까지 실행
 - 실행된 값을 저장할 변수(a)를 선언 (단, 배열로 값을 저장해야 하므로 빈 배열로 선언)
 - append 함수로 i를 a배열에 저장
 - a를 그대로 리턴하면 오름차순으로 값이 리턴되므로 reversed() 함수를 사용해서 값을 내림차순으로 변경한 뒤 해당 값을 리턴
 */

/*:
 ## 📌 n번째 원소부터
 MARK: n번째 원소부터
 
 - 정수 리스트 num_list와 정수 n이 주어질 때, n 번째 원소부터 마지막 원소까지의 모든 원소를 담은 리스트를 return하도록 solution 함수를 완성해주세요.
 
 
 ### 🔹 문제 설명
 - num_list가 [5, 2, 1, 7, 5] 이고 n이 2 라면 2번째부터 나머지 배열의 값을 리턴해야 하므로 [2, 1, 7, 5]를 리턴
 
 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 30
 - 1 ≤ num_list의 원소 ≤ 9
 - 1 ≤ n ≤ num_list의 길이
 */

func solution17(_ num_list:[Int], _ n:Int) -> [Int] {
    var sliceArray = Array(num_list[(n - 1)...])
    
    return sliceArray
}

/*:
 ## 설명
 - num_list[(n - 1)...]를 사용해 n번째 인덱스(배열은 0부터 시작하므로 n-1)부터 끝까지의 부분 배열을 생성
 - 생성된 부분 배열을 Array()로 변환하여 새로운 배열 sliceArray에 저장
 - 최종적으로 sliceArray를 반환하여 원본 배열의 n번째 요소부터 끝까지의 요소들을 포함하는 새 배열을 return
 */


/*:
 ## 📌 문자열 바꿔서 찾기
 MARK: 문자열 바꿔서 찾기
 
 - 문자 "A"와 "B"로 이루어진 문자열 myString과 pat가 주어집니다. myString의 "A"를 "B"로, "B"를 "A"로 바꾼 문자열의 연속하는 부분 문자열 중 pat이 있으면 1을 아니면 0을 return 하는 solution 함수를 완성하세요.
 
 
 ### 🔹 문제 설명
 - myString이 "ABBAA", pat이 "AABB" 라면 "ABBAA"에서 "A"와 "B"를 서로 바꾸면 "BAABB"가 되는데 여기에는 부분문자열 "AABB"가 있기 때문에 1을 return함
 
 
 ### 🔹 제한 사항
 - 1 ≤ myString의 길이 ≤ 100
 - 1 ≤ pat의 길이 ≤ 10
 - myString과 pat는 문자 "A"와 "B"로만 이루어진 문자열입니다.
 */


func solution18(_ myString:String, _ pat:String) -> Int {
    let converted = myString.map { char -> Character in
        if char == "A" {
            return "B"
        } else if char == "B" {
            return "A"
        } else {
            return char
        }
    }
    
    let convertedString = String(converted)
    
    if convertedString.contains(pat) {
        return 1
    } else {
        return 0
    }
}


/*:
 ## 설명
 - myString의 각 문자를 순회하면서 A는 B로 B는 A로 변환
 - map 함수를 사용해서 각 문자를 변환하고 변환된 문자 배열을 String으로 변환
 - contains 메서드를 사용해서 변환된 문자열에 pat이 존재하는지 확인
 - if else문으로 존재한다면 1을, 없다면 0을 return
 */


/*:
 ## 📌 가까운 1 찾기
 MARK: 가까운 1 찾기
 
 - 정수 배열 arr가 주어집니다. 이때 arr의 원소는 1 또는 0입니다. 정수 idx가 주어졌을 때, idx보다 크면서 배열의 값이 1인 가장 작은 인덱스를 찾아서 반환하는 solution 함수를 완성해 주세요. 단, 만약 그러한 인덱스가 없다면 -1을 반환합니다.
 
 
 ### 🔹 문제 설명
 - arr이 [0, 0, 0, 1]이고 idx가 1이라면 1보다 크면서 원소가 1인 가장 작은 인덱스는 3이므로 3을 return
 
 
 ### 🔹 제한 사항
 - 3 ≤ arr의 길이 ≤ 100'000
 - arr의 원소는 전부 1 또는 0입니다.
 
 */

func solution19(_ arr:[Int], _ idx:Int) -> Int {
    for i in (idx)..<arr.count {
        if arr[i] == 1 {
            return i
        }
    }
    return -1
}
/*:
 ## 설명
 
 - 정수 배열 arr가 주어지고, 원소는 1 또는 0으로 구성됨
 - 정수 idx가 주어졌을 때, idx부터 배열을 순회하면서 값이 1인 가장 작은 인덱스를 찾음
 - for 반복문을 사용해 idx부터 배열의 끝까지 순차적으로 확인
 - 조건을 만족하는 첫 번째 인덱스를 발견하면 즉시 해당 인덱스를 반환
 - 조건을 만족하는 인덱스가 없는 경우 -1을 반환
 */


/*:
 ## 📌 간단한 식 계산하기
 MARK: 간단한 식 계산하기
 
 - 문자열 binomial이 매개변수로 주어집니다. binomial은 "a op b" 형태의 이항식이고 a와 b는 음이 아닌 정수, op는 '+', '-', '*' 중 하나입니다. 주어진 식을 계산한 정수를 return 하는 solution 함수를 작성해 주세요.
 
 
 ### 🔹 문제 설명
 - binomial이 "43 + 12" 라면 55를 return
 - binomial이 "0 - 7777" 라면 -7777를 return
 
 ### 🔹 제한 사항
 - 0 ≤ a, b ≤ 40,000
 - 0을 제외하고 a, b는 0으로 시작하지 않습니다.
 */


import Foundation

func solution20(_ binomial:String) -> Int {
    let components = binomial.split(separator: " ")
    
    if components.count == 3,
       let a = Int(components[0]),
       let b = Int(components[2]) {
        let op = String(components[1])
        
        switch op {
        case "+":
            return a + b
        case "-":
            return a - b
        case "*":
            return a * b
        default:
            return 0
        }
    }
    return 0
}

/*:
 ## 설명
 - binomial 문자열을 공백 기준으로 나누기 위해 components 상수를 선언
 - if let문법으로 components의 개수가 3개라면 각각의 요소를 a, b, op 변수에 대입(조건식에서 알 수 있듯이 binomial은 형태가 고정되어 있으므로 항상 개수가 3임)
    - 단, 이때 a와 b는 Int로 타입 변환을 진행
 - switch case문으로 각각의 연산에 맞게 계산을 진행하고 해당 값을 return
 */


/*:
 ## 📌 문자열 잘라서 정렬하기
 MARK: 문자열 잘라서 정렬하기
 
 - 문자열 myString이 주어집니다. "x"를 기준으로 해당 문자열을 잘라내 배열을 만든 후 사전순으로 정렬한 배열을 return 하는 solution 함수를 완성해 주세요. 단, 빈 문자열은 반환할 배열에 넣지 않습니다.
 
 
 ### 🔹 문제 설명
 - myString이 "axbxcxdx" 이라면 return 값은 ["a","b","c","d"]이 되어야 함
 
 ### 🔹 제한 사항
 - 1 ≤ myString ≤ 100,000
    - myString은 알파벳 소문자로 이루어진 문자열입니다.
 */

func solution21(_ myString:String) -> [String] {
    let cutString = myString.components(separatedBy: "x").filter { !$0.isEmpty}
    return cutString.sorted()
}

/*:
 ## 설명
 - myString을 x를 기준으로 문자열을 잘라내야 하기 때문에 components를 사용해서 문자열을 잘라냄
 - 문제에서 빈 문자열은 반환할 배열에 넣지 않는다고 했으므로 filter 함수를 사용해서 빈 문자열을 제외하고 모두 뽑아냄
 - 조건에 맞게 잘라낸 배열을 cutString 변수에 대입하고 해당 변수를 sorted()를 사용해서 사전순으로 정렬하고 해당 값을 return
 */


/*:
 ## 📌 특정한 문자를 대문자로 바꾸기
 MARK: 특정한 문자를 대문자로 바꾸기
 
 - 영소문자로 이루어진 문자열 my_string과 영소문자 1글자로 이루어진 문자열 alp가 매개변수로 주어질 때, my_string에서 alp에 해당하는 모든 글자를 대문자로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.
 
 
 ### 🔹 문제 설명
 -
 
 ### 🔹 제한 사항
 - 1 ≤ my_string의 길이 ≤ 1,000
 */

func solution22(_ my_string:String, _ alp:String) -> String {
    var upperString = ""
    for ch in my_string {
        if ch == Character(alp) {
            upperString += ch.uppercased()
        } else {
            upperString += String(ch)
        }
    }
    
    return upperString
}

/*:
 ## 설명
 - my_string에서 한 글자씩 순회해야 하기 때문에 for문을 사용해서 문자열의 각 문자를 확인
 - 각 문자를 alp와 비교하기 위해 Character(alp)로 타입을 맞추고 비교
 - if else문을 사용해서 만약 문자가 alp와 같다고 uppercased()를 사용해서 해당 문자를 대문자로 변환한 뒤 upperString에 붙임
 - 다르면 원래 문자를 그대로 upperString에 붙임
 - 마지막으로 upperString을 return
 */


/*:
 ## 📌 1로 만들기
 MARK: 1로 만들기
 
 - 정수가 있을 때, 짝수라면 반으로 나누고, 홀수라면 1을 뺀 뒤 반으로 나누면, 마지막엔 1이 됩니다. 정수들이 담긴 리스트 num_list가 주어질 때, num_list의 모든 원소를 1로 만들기 위해서 필요한 나누기 연산의 횟수를 return하도록 solution 함수를 완성해주세요.
 
 
 ### 🔹 문제 설명
 - my_string이 "programmers", alp가 "p"라면 result는 "Programmers"
 
 ### 🔹 제한 사항
 - 3 ≤ num_list의 길이 ≤ 15
 - 1 ≤ num_list의 원소 ≤ 30
 */

func solution23(_ num_list:[Int]) -> Int {
    var totalCount = 0
    
    for num in num_list {
        var n = num
        while n > 1 {
            n /= 2
            totalCount += 1
        }
    }
    return totalCount
}

/*:
 ## 설명
 - 연산 횟수를 저장할 변수 totalCount를 선언
 - for문으로 리스트 안의 숫자 하나씩 반복
 - 현재 숫자를 임시 변수로 저장 (Swift에서 for루프 변수(여기에서는 num)는 let이기 때문
 - 1을 만드는 게 목적이므로 while문으로 n이 1보다 클 동안 계속 반복
 - n을 2로 나눔(홀수인 경우는 자연스럽게 n - 1이 된 후 나누는 것과 같기 때문에 별도 처리 x)
 - 연산이 진행 됐으므로 totalCount에 1을 증가
 - totalCount를 return
 */


/*:
 ## 📌 길이에 따른 연산
 MARK: 길이에 따른 연산
 
 - 정수가 담긴 리스트 num_list가 주어질 때, 리스트의 길이가 11 이상이면 리스트에 있는 모든 원소의 합을 10 이하이면 모든 원소의 곱을 return하도록 solution 함수를 완성해주세요.
 
 ### 🔹 문제 설명
 - num_list가 [2,3,4,5]라면 120을 return
 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 20
 - 1 ≤ num_list의 원소 ≤ 9
 - num_list의 원소를 모두 곱했을 때 2,147,483,647를 넘는 입력은 주어지지 않습니다.

 */

func solution24(_ num_list:[Int]) -> Int {
    let count = num_list.count
    var sum = 0
    var product = 0
    
    if count >= 11 {
        sum = num_list.reduce(0, +)
        return sum
    } else {
        product = num_list.reduce(1, *)
        return product
    }
}

/*:
 ## 설명
 - num_list의 길이를 담을 변수와 num_list의 합, 곱을 담을 변수를 각각 선언
 - if문으로 num_list의 길이가 11 이상이라면 reduce 함수로 0부터 쭉 모아서 더해주고 sum을 return
 - 그 외의 조건은 reduce 함수로 1부터 모아서 곱해주고 해당 값을 return함
    - 0부터 모으지 않은 이유는 0을 포함하는 순간 0도 같이 곱해지기 때문에 결과 값이 항상 0이 나옴
 */



/*:
 ## 📌 대문자로 바꾸기
 MARK: 대문자로 바꾸기
 
 - 알파벳으로 이루어진 문자열 myString이 주어집니다. 모든 알파벳을 대문자로 변환하여 return 하는 solution 함수를 완성해 주세요.
 
 ### 🔹 문제 설명
 - myString 이 "aBcDeFg"라면 "ABCDEFG"를 리턴
 
 ### 🔹 제한 사항
 - 1 ≤ myString의 길이 ≤ 100,000
    - myString은 알파벳으로 이루어진 문자열입니다.


 */

func solution25(_ myString:String) -> String {
    let Change = myString.uppercased()
    
    return Change
}

/*:
 ## 설명
 - uppercased() 함수는 소문자를 대문자로 변경해주는 함수이므로 해당 함수를 이용
 - myString에 uppercased()를 적용해주고 적용된 값을 Change 변수에 담은 후 해당 변수를 return
 */


/*:
 ## 📌 소문자로 바꾸기
 MARK: 소문자로 바꾸기
 
 - 알파벳으로 이루어진 문자열 myString이 주어집니다. 모든 알파벳을 소문자로 변환하여 return 하는 solution 함수를 완성해 주세요.
 
 ### 🔹 문제 설명
 - myString 이 "aBcDeFg"라면 "abcdefg"를 리턴
 
 ### 🔹 제한 사항
 - 1 ≤ myString의 길이 ≤ 100,000
    - myString은 알파벳으로 이루어진 문자열입니다.
 */

func solution26(_ myString:String) -> String {
    let change = myString.lowercased()
    
    return change
}

/*:
 ## 설명
 - lowercased() 함수는 대문자를 소문자로 변경해주는 함수이므로 해당 함수를 이용
 - myString에 lowercased()를 적용해주고 적용된 값을 change 변수에 담은 후 해당 변수를 return
 */



/*:
 ## 📌 원하는 문자열 찾기
 MARK: 원하는 문자열 찾기
 
 - 알파벳으로 이루어진 문자열 myString과 pat이 주어집니다. myString의 연속된 부분 문자열 중 pat이 존재하면 1을 그렇지 않으면 0을 return 하는 solution 함수를 완성해 주세요. 단, 알파벳 대문자와 소문자는 구분하지 않습니다.
 
 ### 🔹 문제 설명
 - myString 이 "AbCdEfG" 이고 pat이 "aBc"라면 1을 return
 - myString 이 "aaAA" 이고 pat이 "aaaaa"라면 0을 리턴
 
 ### 🔹 제한 사항
 - 1 ≤ myString의 길이 ≤ 100,000
 - 1 ≤ pat의 길이 ≤ 300
 - myString과 pat은 모두 알파벳으로 이루어진 문자열입니다.

 */

func solution27(_ myString:String, _ pat:String) -> Int {
    let lowercaseString = myString.lowercased()
    let lowercasePat = pat.lowercased()
    
    return lowercaseString.contains(lowercasePat) ? 1 : 0
}

/*:
 ## 설명
 - lowercased() 함수는 대문자를 소문자로 변경해주는 함수이므로 해당 함수를 이용
 - 두 문자열을 소문자로 변환하여 대소문자 구분 없이 비교
 - contains 메서드로 문자열 포함 여부를 확인하여 결과 반환
 */


/*:
 ## 📌 A 강조하기
 MARK: A 강조하기
 
 - 문자열 myString이 주어집니다. myString에서 알파벳 "a"가 등장하면 전부 "A"로 변환하고, "A"가 아닌 모든 대문자 알파벳은 소문자 알파벳으로 변환하여 return 하는 solution 함수를 완성하세요.
 
 ### 🔹 문제 설명
 - myString이 "abstract algebra" 라면 "AbstrAct AlgebrA"를 return
 
 ### 🔹 제한 사항
 - 1 ≤ myString의 길이 ≤ 20
     - myString은 알파벳으로 이루어진 문자열입니다.

 */

func solution28(_ myString:String) -> String {
    let lowercase = myString.lowercased()
    let result = lowercase.map { $0 == "a" ? "A" : String($0)} .joined()
    
    return result
    
    
    // 더 효율적인 다른 풀이
    func anotherSolution28(_ myString:String) -> String {
        return myString.lowercased().replacingOccurrences(of: "a", with: "A")
    }
}

/*:
 ## 설명
 - lowercased() 함수로 전체 문자열을 소문자로 변환하고 lowercase 변수에 저장
 - lowercase에 있는 문자열 중에서 map함수로 소문자 a가 있다면 대문자 A로 변환하고 joined() 함수로 다시 lowercase에 넣음
 - 해당 결과를 return
 */



/*:
 ## 📌 ad 제거하기
 MARK: ad 제거하기
 
 - 문자열 배열 strArr가 주어집니다. 배열 내의 문자열 중 "ad"라는 부분 문자열을 포함하고 있는 모든 문자열을 제거하고 남은 문자열을 순서를 유지하여 배열로 return 하는 solution 함수를 완성해 주세요.
 
 ### 🔹 문제 설명
 - strArr가 ["and","notad","abcd"]이라면 ["and", "abcd"]를 return
 
 ### 🔹 제한 사항
 - 1 ≤ strArr의 길이 ≤ 1,000
    - 1 ≤ strArr의 원소의 길이 ≤ 20
    - strArr의 원소는 알파벳 소문자로 이루어진 문자열입니다.

 */

func solution29(_ strArr:[String]) -> [String] {
    let result = strArr.filter{ !$0.contains("ad") }
    
    return result
}
/*:
 ## 설명
 - filter로 배열에서 특정 조건을 만족하는 요소만 남김
 - contains("ad")는 문자열 안에 "ad"라는 부분 문자열이 포함되어 있는지를 검사
 - !$0.contains("ad")는 "ad"가 없는 문자열만 남게 됨
 */


/*:
 ## 📌 공백으로 구분하기 1
 MARK: 공백으로 구분하기 1
 
 - 단어가 공백 한 개로 구분되어 있는 문자열 my_string이 매개변수로 주어질 때, my_string에 나온 단어를 앞에서부터 순서대로 담은 문자열 배열을 return 하는 solution 함수를 작성해 주세요.
 
 
 ### 🔹 문제 설명
 - my_string이 "i love you" 라면 ["i", "love", "you"]을 return
 
 ### 🔹 제한 사항
 - my_string은 영소문자와 공백으로만 이루어져 있습니다.
 - 1 ≤ my_string의 길이 ≤ 1,000
 - my_string의 맨 앞과 맨 뒤에 글자는 공백이 아닙니다.

 */

func solution30(_ my_string:String) -> [String] {
    let words = my_string.split(separator: " ").map { String($0)}
    return words
}

/*:
 ## 설명
 - split()을 사용해서 공백을 기준으로 나눔
 - String 배열로 반환을 해야 하므로 map 함수를 사용
 - 해당 값을 저장한 words 변수를 return
 */


/*:
 ## 📌 공백으로 구분하기 2
 MARK: 공백으로 구분하기 2
 
 - 단어가 공백 한 개 이상으로 구분되어 있는 문자열 my_string이 매개변수로 주어질 때, my_string에 나온 단어를 앞에서부터 순서대로 담은 문자열 배열을 return 하는 solution 함수를 작성해 주세요.
 
 
 ### 🔹 문제 설명
 - my_string이 " i    love  you" 라면 ["i", "love", "you"]을 return
 
 ### 🔹 제한 사항
  - my_string은 영소문자와 공백으로만 이루어져 있습니다.
  - 1 ≤ my_string의 길이 ≤ 1,000
  - my_string의 맨 앞과 맨 뒤에도 공백이 있을 수 있습니다.
  - my_string에는 단어가 하나 이상 존재합니다.

 */

func solution31(_ my_string:String) -> [String] {
    let words = my_string.split(separator: " ").map { String($0)}
    return words
}

/*:
 ## 설명
 - Swift의 split은 공백 여러 개가 붙어 있어도 각각 분리되기 때문에 위 문제와 동일하게 split을 사용할 수 있음
 */



/*:
 ## 📌 주사위 게임 1
 MARK: 주사위 게임 1
 
 - 1부터 6까지 숫자가 적힌 주사위가 두 개 있습니다. 두 주사위를 굴렸을 때 나온 숫자를 각각 a, b라고 했을 때 얻는 점수는 다음과 같습니다.
    - a와 b가 모두 홀수라면 a2 + b2 점을 얻습니다.
    - a와 b 중 하나만 홀수라면 2 × (a + b) 점을 얻습니다.
    - a와 b 모두 홀수가 아니라면 |a - b| 점을 얻습니다.
 - 두 정수 a와 b가 매개변수로 주어질 때, 얻는 점수를 return 하는 solution 함수를 작성해 주세요.
 
 
 ### 🔹 문제 설명
 - a가 3 b가 5라면 34를 return
 - a가 6 b가 1라면 14를 return
 - a가 2 b가 4라면 2를 return
 
 ### 🔹 제한 사항
  - a와 b는 1 이상 6 이하의 정수입니다.

 */

func solution32(_ a:Int, _ b:Int) -> Int {
    if (a % 2 == 1 && b % 2 == 1) {
        return (a * a) + (b * b)
    } else if (a % 2 == 1 && b % 2 == 0) || (a % 2 == 0 && b % 2 == 1) {
        return 2 * (a + b)
    } else {
        return abs(a - b)
    }
}

/*:
 ## 설명
 - if else 문을 사용해 세 가지 케이스로 분기 처리
 - 첫 번째 조건은 a와 b가 모두 홀수일 때 해당 -> && (AND 연산자)를 사용해 두 조건이 모두 참일 때만 실행
 - 두 번째 조건은 a와 b 중 하나만 홀수일 때 해당 → || (OR 연산자)를 사용해 둘 중 하나만 참이면 실행됨
    - (a % 2 == 1 && b % 2 == 0) 또는 (a % 2 == 0 && b % 2 == 1) 중 하나라도 참이면 해당
 - 세 번째 조건은 a와 b가 모두 짝수일 때 해당되며, 위 조건에 해당하지 않는 나머지 경우를 처리
 - 이때 abs(a - b)는 a와 b의 차이를 절댓값으로 반환함 (음수 방지)
 */


/*:
 ## 📌 숫자 짝꿍
 MARK: 숫자 짝꿍
 
 - 두 정수 X, Y의 임의의 자리에서 공통으로 나타나는 정수 k(0 ≤ k ≤ 9)들을 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라 합니다(단, 공통으로 나타나는 정수 중 서로 짝지을 수 있는 숫자만 사용합니다). X, Y의 짝꿍이 존재하지 않으면, 짝꿍은 -1입니다. X, Y의 짝꿍이 0으로만 구성되어 있다면, 짝꿍은 0입니다.
 
 - 예를 들어, X = 3403이고 Y = 13203이라면, X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 3, 0, 3으로 만들 수 있는 가장 큰 정수인 330입니다. 다른 예시로 X = 5525이고 Y = 1255이면 X와 Y의 짝꿍은 X와 Y에서 공통으로 나타나는 2, 5, 5로 만들 수 있는 가장 큰 정수인 552입니다(X에는 5가 3개, Y에는 5가 2개 나타나므로 남는 5 한 개는 짝 지을 수 없습니다.) 두 정수 X, Y가 주어졌을 때, X, Y의 짝꿍을 return하는 solution 함수를 완성해주세요.
 
 
 ### 🔹 문제 설명
 - X는 "100", Y는 "2345"면 -1을 return
 - X는 "100", Y는 "203045"면 0을 return
 - X는 "100", Y는 "123450"면 10을 return
 
 - a가 6 b가 1라면 14를 return
 - a가 2 b가 4라면 2를 return
 
 ### 🔹 제한 사항
 - 3 ≤ X, Y의 길이(자릿수) ≤ 3,000,000입니다.
 - X, Y는 0으로 시작하지 않습니다.
 - X, Y의 짝꿍은 상당히 큰 정수일 수 있으므로, 문자열로 반환합니다.

 */

func solution33(_ X:String, _ Y:String) -> String {
    var countX = Array(repeating: 0, count: 10)
    var countY = Array(repeating: 0, count: 10)
    
    for ch in X {
        if let digit = ch.wholeNumberValue {
            countX[digit] += 1
        }
    }
    for ch in Y {
        if let digit = ch.wholeNumberValue {
            countY[digit] += 1
        }
    }
    var result = ""
    
    for i in stride(from: 9, through: 0, by: -1) {
        let commonCount = min(countX[i], countY[i])
        if commonCount > 0 {
            result += String(repeating: "\(i)", count: commonCount)
        }
    }
    
    if result.isEmpty {
        return "-1"
    } else if result.first == "0" {
        return "0"
    } else {
        return result
    }
}

/*:
 ## 설명
 - 두 문자열 X와 Y에서 각 숫자(0~9)의 등장 횟수를 배열(countX, countY)에 저장
 - 각 숫자마다 등장 횟수를 기록하면, 숫자별로 얼마나 겹치는지 빠르게 알 수 있음
 - 이후 9부터 0까지 숫자를 내림차순으로 탐색
    - 가장 큰 수를 만들기 위해 높은 숫자부터 결과 문자열에 추가
 - 각 숫자 i에 대해 X와 Y 모두에서 나타나는 개수의 최솟값(min)을 계산하여 짝 지을 수 있는 개수를 구함
    - 예: X에 5가 3번, Y에 5가 2번 → 짝 지을 수 있는 5는 2개
    - 이때 String(repeating: "\(i)", count: 개수)를 사용해 해당 숫자를 여러 번 붙임
 - 최종적으로 만들어진 문자열 result가 다음 조건 중 하나에 해당할 경우 예외 처리
    - 아무 숫자도 짝지어지지 않은 경우 → result는 빈 문자열("") → "-1" 반환
    - 결과가 "000..."처럼 0으로만 구성된 경우 → "0" 반환
 - 위 두 경우 외에는 result 문자열을 그대로 반환
 */


/*:
 ## 📌 원소들의 곱과 합
 MARK: 원소들의 곱과 합
 
 - 정수가 담긴 리스트 num_list가 주어질 때, 모든 원소들의 곱이 모든 원소들의 합의 제곱보다 작으면 1을 크면 0을 return하도록 solution 함수를 완성해주세요.
  
 
 ### 🔹 문제 설명
 - num_list가 [3, 4, 5, 2, 1]이라면 1을 return
 - num_list가 [5, 7, 8, 3]이라면 0을 return
 
 - a가 6 b가 1라면 14를 return
 - a가 2 b가 4라면 2를 return
 
 ### 🔹 제한 사항
 - 2 ≤ num_list의 길이 ≤ 10
 - 1 ≤ num_list의 원소 ≤ 9

 */

func solution34(_ num_list: [Int]) -> Int {
    let product = num_list.reduce(1, *)
    let sum = num_list.reduce(0, +)
    
    return product < sum * sum ? 1 : 0
}

/*:
 ## 설명
 - 리스트에 있는 모든 원소들의 곱(product)을 reduce(1, *)로 계산
   - 곱셈의 항등원 1을 초기값으로 사용하여 모든 원소를 곱함

 - 리스트에 있는 모든 원소들의 합(sum)을 reduce(0, +)로 계산
   - 덧셈의 항등원 0을 초기값으로 사용하여 모든 원소를 더함

 - 조건 비교:
   - product < sum * sum 인지 검사
   - 즉, 원소의 곱이 원소의 합의 제곱보다 작으면 1 반환 (삼항 연산자를 사용)
   - 그렇지 않으면 0 반환
 */


/*:
 ## 📌 숫자 문자열과 영단어
 MARK: 숫자 문자열과 영단어
 
 - 네오와 프로도가 숫자놀이를 하고 있습니다. 네오가 프로도에게 숫자를 건넬 때 일부 자릿수를 영단어로 바꾼 카드를 건네주면 프로도는 원래 숫자를 찾는 게임입니다.

 - 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.

 - 1478 → "one4seveneight"
 - 234567 → "23four5six7"
 - 10203 → "1zerotwozero3"
 - 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.
  
 
 ### 🔹 문제 설명
 - num_list가 [3, 4, 5, 2, 1]이라면 1을 return
 - num_list가 [5, 7, 8, 3]이라면 0을 return
 
 - a가 6 b가 1라면 14를 return
 - a가 2 b가 4라면 2를 return
 
 ### 🔹 제한 사항
 - 1 ≤ s의 길이 ≤ 50
 - s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
 - return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.

 */

func solution35(_ s:String) -> Int {
    let numberWords: [String: String] = [
        "zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4",
        "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9"
    ]
    
    var result = s
    
    for (word, digit) in numberWords {
        result = result.replacingOccurrences(of: word, with: digit)
    }
    return Int(result)!
}

/*:
 ## 설명
 - 먼저 numberWords 딕셔너리 선언해서 "영단어" -> "숫자" 형태로 변환 규칙을 저장
 - result 변수에 s 매개변수를 복사해서 사용(s는 함수 매개변수이기 때문에 상수로 간주되므로 수정 가능한 result를 선언)
 - for 루프를 통해서 "zero"부터 "nine"까지 차례로 변환
 - replacingOccurrences(of: with:) 함수를 사용해서 word를 digit으로 바꿈
 - 변환이 끝나면 result를 Int로 형변환을 하고 강제 언래핑을 한 후 return
    - 강제 언래핑을 하는 이유는 Int(...)는 항상 옵셔널 타입으로 반환하고 이 문제에서는 nil이 없기 때문에 강제 언래핑을 사용함
    - 만약 문제에서 nil도 포함이 된다면 if let or guard let을 사용해서 옵셔널 바인딩을 해야 함
 */


/*:
 ## 📌 0 떼기
 MARK: 0 떼기
 
 - 정수로 이루어진 문자열 n_str이 주어질 때, n_str의 가장 왼쪽에 처음으로 등장하는 0들을 뗀 문자열을 return하도록 solution 함수를 완성해주세요.
 
 ### 🔹 문제 설명
 - n_str이 "0010"이라면 "10"을 return
 
 ### 🔹 제한 사항
 - 2 ≤ n_str ≤ 10
 - n_str이 "0"으로만 이루어진 경우는 없습니다.
 */

func solution36(_ n_str:String) -> String {
    let result = n_str.drop(while: { $0 == "0"})
    return String(result)
}

/*:
 ## 설명
 - drop(while:)을 사용해서 문자 하나하나를 받아서 "0"일 때만 0을 제거하도록 조건을 설정
 - (0이 연속으로 2번 나오면, 첫 번째 0에서 해당 조건이 성공 했으므로 두 번째 0에서도 해당 동작 수행)
 - 0이 안 나오는 순간부터는 남은 문자들을 유지
 - 해당 결과는 Substring 타입이므로 result를 String()으로 감싸서 return
 */


/*:
 ## 📌 문자열로 변환
 MARK: 문자열로 변환
 
 - 정수 n이 주어질 때, n을 문자열로 변환하여 return하도록 solution 함수를 완성해주세요.
 
 ### 🔹 문제 설명
 - n_str이 "0010"이라면 "10"을 return
 
 ### 🔹 제한 사항
 - 1 ≤ n ≤ 10000
 */

func solution37(_ n:Int) -> String {
    var stringNumber = String(n)
    return stringNumber
}

/*:
 ## 설명
 - 문자열로 변환한 값을 담을 변수를 선언하고 해당 변수에 String(n)을 대입
 - 해당 변수를 return
 */

/*:
 ## 📌 햄버거 만들기
 MARK: 햄버거 만들기
 
 - 햄버거 가게에서 일을 하는 상수는 햄버거를 포장하는 일을 합니다. 함께 일을 하는 다른 직원들이 햄버거에 들어갈 재료를 조리해 주면 조리된 순서대로 상수의 앞에 아래서부터 위로 쌓이게 되고, 상수는 순서에 맞게 쌓여서 완성된 햄버거를 따로 옮겨 포장을 하게 됩니다. 상수가 일하는 가게는 정해진 순서(아래서부터, 빵 – 야채 – 고기 - 빵)로 쌓인 햄버거만 포장을 합니다. 상수는 손이 굉장히 빠르기 때문에 상수가 포장하는 동안 속 재료가 추가적으로 들어오는 일은 없으며, 재료의 높이는 무시하여 재료가 높이 쌓여서 일이 힘들어지는 경우는 없습니다.
 
 - 예를 들어, 상수의 앞에 쌓이는 재료의 순서가 [야채, 빵, 빵, 야채, 고기, 빵, 야채, 고기, 빵]일 때, 상수는 여섯 번째 재료가 쌓였을 때, 세 번째 재료부터 여섯 번째 재료를 이용하여 햄버거를 포장하고, 아홉 번째 재료가 쌓였을 때, 두 번째 재료와 일곱 번째 재료부터 아홉 번째 재료를 이용하여 햄버거를 포장합니다. 즉, 2개의 햄버거를 포장하게 됩니다.

 - 상수에게 전해지는 재료의 정보를 나타내는 정수 배열 ingredient가 주어졌을 때, 상수가 포장하는 햄버거의 개수를 return 하도록 solution 함수를 완성하시오.
 
 ### 🔹 문제 설명
 - 재료가 아래에서부터 위로 쌓이고, 정해진 순서 [1, 2, 3, 1] (빵-야채-고기-빵)이 되면 하나의 햄버거로 인식하여 포장
 - 포장한 햄버거는 스택에서 제거되고, 이후에도 쌓이는 재료로 다시 햄버거를 만듦
 - 주어진 'ingredient' 배열은 재료가 쌓이는 순서를 나타내며, 상수가 포장한 햄버거의 총 개수를 return해야 함
 
 ### 🔹 제한 사항
 - 1 ≤ ingredient의 길이 ≤ 1,000,000
 - ingredient의 원소는 1, 2, 3 중 하나의 값이며, 순서대로 빵, 야채, 고기를 의미합니다.
 */

func solution38(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var count = 0
    for ingredient in ingredient {
        stack.append(ingredient)
        if stack.count >= 4 && stack.suffix(4) == [1, 2, 3, 1] {
            stack.removeLast(4)
            count += 1
        }
    }
    return count
}

// 시간 복잡도 개선 버전
func solution38_1(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var count = 0
    for ingredient in ingredient {
        stack.append(ingredient)
        if stack.count >= 4 && stack.suffix(4) == [1, 2, 3, 1] {
            stack.removeLast(4)
            count += 1
        }
    }
    return count
}


/*:
 ## 설명
 - stack: 현재 쌓여 있는 재료들을 저장하는 배열
 - count: 포장한 햄버거의 총 개수
 - for문과 append()를 사용해서 ingredient를 stack안에 쌓음
 - if문으로 스택의 마지막 재료가 [1, 2, 3, 1]이 되면 해당 스택 4개를 제거하고 count를 1 증가 시킴
 - 최종적으로 포장한 햄버거의 수(count)를 return
 */

/*:
 ## 설명
 - 문자열로 변환한 값을 담을 변수를 선언하고 해당 변수에 String(n)을 대입
 - 해당 변수를 return
 */

/*:
 ## 📌 가장 많이 받은 선물
 MARK: 가장 많이 받은 선물
 
 - 선물을 직접 전하기 힘들 때 카카오톡 선물하기 기능을 이용해 축하 선물을 보낼 수 있습니다. 당신의 친구들이 이번 달까지 선물을 주고받은 기록을 바탕으로 다음 달에 누가 선물을 많이 받을지 예측하려고 합니다. 두 사람이 선물을 주고받은 기록이 있다면, 이번 달까지 두 사람 사이에 더 많은 선물을 준 사람이 다음 달에 선물을 하나 받습니다. 예를 들어 A가 B에게 선물을 5번 줬고, B가 A에게 선물을 3번 줬다면 다음 달엔 A가 B에게 선물을 하나 받습니다. 두 사람이 선물을 주고받은 기록이 하나도 없거나 주고받은 수가 같다면, 선물 지수가 더 큰 사람이 선물 지수가 더 작은 사람에게 선물을 하나 받습니다. 선물 지수는 이번 달까지 자신이 친구들에게 준 선물의 수에서 받은 선물의 수를 뺀 값입니다. 예를 들어 A가 친구들에게 준 선물이 3개고 받은 선물이 10개라면 A의 선물 지수는 -7입니다. B가 친구들에게 준 선물이 3개고 받은 선물이 2개라면 B의 선물 지수는 1입니다. 만약 A와 B가 선물을 주고받은 적이 없거나 정확히 같은 수로 선물을 주고받았다면, 다음 달엔 B가 A에게 선물을 하나 받습니다. 만약 두 사람의 선물 지수도 같다면 다음 달에 선물을 주고받지 않습니다. 위에서 설명한 규칙대로 다음 달에 선물을 주고받을 때, 당신은 선물을 가장 많이 받을 친구가 받을 선물의 수를 알고 싶습니다. 친구들의 이름을 담은 1차원 문자열 배열 friends 이번 달까지 친구들이 주고받은 선물 기록을 담은 1차원 문자열 배열 gifts가 매개변수로 주어집니다. 이때, 다음달에 가장 많은 선물을 받는 친구가 받을 선물의 수를 return 하도록 solution 함수를 완성해 주세요.

 
 ### 🔹 문제 설명
 - 모든 친구 쌍에 대해 다음 달에 누가 선물을 받는지 계산함
 - 누가 선물을 얼마나 받는지를 모두 계산해서, 그 중 가장 많이 받은 수를 return
 
 - friends가 ["muzi", "ryan", "frodo", "neo"]이고 gifts가 ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]라면 2를 return
  - friends가 ["joy", "brad", "alessandro", "conan", "david"]이고 gifts가 ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]라면 4를 return
  - friends가 ["a", "b", "c"]이고 gifts가 ["a b", "b a", "c a", "a c", "a c", "c a"]라면 0을 return
 
  ### 🔹 제한 사항
 - 2 ≤ friends의 길이 = 친구들의 수 ≤ 50
 - friends의 원소는 친구의 이름을 의미하는 알파벳 소문자로 이루어진 길이가 10 이하인 문자열
 - 1 ≤ gifts의 길이 ≤ 10,000
 - gifts의 원소는 "A B"형태의 문자열이며 A는 선물을 준 친구, B는 선물을 받은 친구를 의미

 */

func solution39(_ friends: [String], _ gifts: [String]) -> Int {
    // 친구 수를 저장 (예: ["muzi", "ryan", "frodo", "neo"]라면 n = 4)
    let n = friends.count
    
    // 친구 이름을 숫자로 바꿔주는 사전 만들기
    // 예: "muzi" -> 0, "ryan" -> 1, "frodo" -> 2, "neo" -> 3
    var nameToIndex: [String: Int] = [:]
    for (index, friend) in friends.enumerated() {
        nameToIndex[friend] = index
    }
    
    // 누가 누구에게 선물을 몇 개 줬는지 기록하는 표 만들기
    // giftRecord[0][1] = muzi가 ryan에게 준 선물 개수
    // 처음에는 모든 값이 0으로 설정됨
    var giftRecord = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    // 각 친구가 준 선물과 받은 선물의 총 개수를 세는 배열
    var given = Array(repeating: 0, count: n)     // 준 선물 개수
    var received = Array(repeating: 0, count: n)  // 받은 선물 개수
    
    // 선물 기록을 하나씩 읽어서 처리하기
    // 예: "muzi frodo"라면 muzi가 frodo에게 선물을 준 것
    for gift in gifts {
        // 공백으로 나누기: "muzi frodo" -> ["muzi", "frodo"]
        let parts = gift.split(separator: " ")
        let giver = String(parts[0])      // 선물을 준 사람
        let receiver = String(parts[1])   // 선물을 받은 사람
        
        // 이름을 숫자로 바꾸기
        let giverIndex = nameToIndex[giver]!
        let receiverIndex = nameToIndex[receiver]!
        
        // 선물 기록 표에 1개 추가
        giftRecord[giverIndex][receiverIndex] += 1
        // 준 사람의 "준 선물" 개수 1개 증가
        given[giverIndex] += 1
        // 받은 사람의 "받은 선물" 개수 1개 증가
        received[receiverIndex] += 1
    }
    
    // 선물 지수 계산하기 (준 선물 개수 - 받은 선물 개수)
    // 예: muzi가 5개 주고 3개 받았다면 선물지수는 5-3=2
    var giftIndex = Array(repeating: 0, count: n)
    for i in 0..<n {
        giftIndex[i] = given[i] - received[i]
    }
    
    // 다음 달에 각 친구가 받을 선물의 수를 저장할 배열
    var nextMonthGifts = Array(repeating: 0, count: n)
    
    // 모든 친구 쌍을 비교해서 누가 선물을 받을지 결정하기
    // i < j로 하는 이유: 같은 쌍을 두 번 비교하지 않기 위해
    for i in 0..<n {
        for j in (i+1)..<n {
            // i가 j에게 준 선물 개수
            let iToJ = giftRecord[i][j]
            // j가 i에게 준 선물 개수
            let jToI = giftRecord[j][i]
            
            if iToJ > jToI {
                // i가 j보다 더 많이 줬다면, i가 선물을 하나 받음
                nextMonthGifts[i] += 1
            } else if jToI > iToJ {
                // j가 i보다 더 많이 줬다면, j가 선물을 하나 받음
                nextMonthGifts[j] += 1
            } else {
                // 주고받은 개수가 같거나 주고받은 적이 없는 경우
                // 선물 지수가 더 큰 사람이 선물을 받음
                if giftIndex[i] > giftIndex[j] {
                    nextMonthGifts[i] += 1
                } else if giftIndex[j] > giftIndex[i] {
                    nextMonthGifts[j] += 1
                }
                // 선물 지수도 똑같다면 아무도 선물을 안 받음 (아무것도 안 함)
            }
        }
    }
    
    // 가장 많이 받을 선물의 개수를 찾아서 반환
    return nextMonthGifts.max() ?? 0
}
/*:
 ## 설명
 - 먼저 nameToIndex 딕셔너리를 선언해서 친구 이름을 숫자 인덱스로 변환하는 매핑 테이블을 만듦
 - giftRecord 2차원 배열을 선언해서 i번째 친구가 j번째 친구에게 준 선물 개수를 저장
   - Array(repeating: Array(repeating: 0, count: n), count: n)로 n×n 크기의 0으로 초기화된 2차원 배열 생성
 - given, received 배열을 선언해서 각 친구가 준 선물과 받은 선물의 총 개수를 추적
 - for 루프를 통해 gifts 배열의 각 선물 기록을 처리
   - split(separator: " ")를 사용해서 "A B" 형태의 문자열을 A와 B로 분리
   - nameToIndex 딕셔너리를 사용해서 이름을 인덱스로 변환
   - giftRecord, given, received 배열을 업데이트
 - giftIndex 배열을 계산해서 각 친구의 선물 지수(준 선물 - 받은 선물)를 저장
 - 이중 for 루프를 사용해서 모든 친구 쌍을 비교 (i < j 조건으로 중복 방지)
   - 직접 주고받은 선물 수를 비교해서 더 많이 준 사람이 선물을 받음
   - 같다면 선물 지수를 비교해서 높은 사람이 선물을 받음
   - 선물 지수도 같다면 아무도 선물을 받지 않음
 - nextMonthGifts.max() ?? 0을 사용해서 가장 많이 받을 선물의 개수를 반환
   - max()는 옵셔널을 반환하므로 nil coalescent operator(??)를 사용해서 nil인 경우 0을 반환
 */


/*:
 ## 📌 세 개의 구분자
 MARK: 세 개의 구분자
 
 - 임의의 문자열이 주어졌을 때 문자 "a", "b", "c"를 구분자로 사용해 문자열을 나누고자 합니다. 예를 들어 주어진 문자열이 "baconlettucetomato"라면 나눠진 문자열 목록은 ["onlettu", "etom", "to"] 가 됩니다. 문자열 myStr이 주어졌을 때 위 예시와 같이 "a", "b", "c"를 사용해 나눠진 문자열을 순서대로 저장한 배열을 return 하는 solution 함수를 완성해 주세요. 단, 두 구분자 사이에 다른 문자가 없을 경우에는 아무것도 저장하지 않으며, return할 배열이 빈 배열이라면 ["EMPTY"]를 return 합니다.

 
 ### 🔹 문제 설명
 - myStr이 ["abcd"] 라면 ["d"]를 return
 - myStr이 ["cabab"] 라면 ["EMPTY"]를 return
 
  ### 🔹 제한 사항
 - 1 ≤ myStr의 길이 ≤ 1,000,000
    - myStr은 알파벳 소문자로 이루어진 문자열 입니다.

 */

func solution40(_ myStr:String) -> [String] {
    let result = myStr.components(separatedBy: CharacterSet(charactersIn: "abc"))
    let filtered = result.filter { !$0.isEmpty }
    
    return filtered.isEmpty ? ["EMPTY"] : filtered
}

/*:
 ## 설명
 - ["a", "b", "c"] 기준으로 문자열을 나누기 위해서 components(separatedBy:)를 사용해서 문자열을 a, b, c 기준으로 잘라서 배열로 만듦
 - components는 연속된 구분자가 있을 때나 처음이나 끝에 구분자가 있을 때, 그 사이에 글자가 없으면 빈 문자열이 결과에 생기므로 filter 함수를 사용해서 빈 문자열은 제거
 - filtered를 return, 단 문제에서 return 하는 배열이 빈 배열이라면 ["EMPTY"]를 return해야 하므로 삼항 연산자를 사용해서 빈 배열이라면 ["EMPTY"]를 return
 */

/*:
 ## 📌 정수 부분
 MARK: 정수 부분
 
 - 실수 flo가 매개 변수로 주어질 때, flo의 정수 부분을 return하도록 solution 함수를 완성해주세요.

 ### 🔹 문제 설명
 - flo가 1.42 라면 1을 return
 - flo가 69.32 라면 69를 return
 
  ### 🔹 제한 사항
 - 0 ≤ flo ≤ 100

 */

func solution41(_ flo:Double) -> Int {
    let floInt = Int(flo)
    return floInt
}
/*:
 ## 설명
 - 매개변수로 주어진 실수 'flo'에서 소수점 아래를 제외한 정수 부분만을 구해야 하므로 'Int(flo)'를 통해 실수를 정수형으로 변환
 - 'Double'을 'Int'로 변환할 경우 소수점 이하가 자동으로 버려지고 내림(truncation) 방식으로 변환되므로 별도의 추가 처리 없이 정수 부분만 추출 가능
 - 변환된 값을 그대로 return
 */


/*:
 ## 📌 덧칠하기
 MARK: 덧칠하기
 
 - 어느 학교에 페인트가 칠해진 길이가 n미터인 벽이 있습니다. 벽에 동아리 · 학회 홍보나 회사 채용 공고 포스터 등을 게시하기 위해 테이프로 붙였다가 철거할 때 떼는 일이 많고 그 과정에서 페인트가 벗겨지곤 합니다. 페인트가 벗겨진 벽이 보기 흉해져 학교는 벽에 페인트를 덧칠하기로 했습니다.
 
 넓은 벽 전체에 페인트를 새로 칠하는 대신, 구역을 나누어 일부만 페인트를 새로 칠 함으로써 예산을 아끼려 합니다. 이를 위해 벽을 1미터 길이의 구역 n개로 나누고, 각 구역에 왼쪽부터 순서대로 1번부터 n번까지 번호를 붙였습니다. 그리고 페인트를 다시 칠해야 할 구역들을 정했습니다.

 벽에 페인트를 칠하는 롤러의 길이는 m미터이고, 롤러로 벽에 페인트를 한 번 칠하는 규칙은 다음과 같습니다.

 롤러가 벽에서 벗어나면 안 됩니다.
 구역의 일부분만 포함되도록 칠하면 안 됩니다.
 즉, 롤러의 좌우측 끝을 구역의 경계선 혹은 벽의 좌우측 끝부분에 맞춘 후 롤러를 위아래로 움직이면서 벽을 칠합니다. 현재 페인트를 칠하는 구역들을 완전히 칠한 후 벽에서 롤러를 떼며, 이를 벽을 한 번 칠했다고 정의합니다.

 한 구역에 페인트를 여러 번 칠해도 되고 다시 칠해야 할 구역이 아닌 곳에 페인트를 칠해도 되지만 다시 칠하기로 정한 구역은 적어도 한 번 페인트칠을 해야 합니다. 예산을 아끼기 위해 다시 칠할 구역을 정했듯 마찬가지로 롤러로 페인트칠을 하는 횟수를 최소화하려고 합니다.

 정수 n, m과 다시 페인트를 칠하기로 정한 구역들의 번호가 담긴 정수 배열 section이 매개변수로 주어질 때 롤러로 페인트칠해야 하는 최소 횟수를 return 하는 solution 함수를 작성해 주세요.



 ### 🔹 문제 설명
 - n이 8, m이 4, section이 [2, 3, 6] 이라면 2를 return
 - flo가 69.32 라면 69를 return
 
  ### 🔹 제한 사항
 - 1 ≤ m ≤ n ≤ 100,000
 - 1 ≤ section의 길이 ≤ n
    - 1 ≤ section의 원소 ≤ n
    - section의 원소는 페인트를 다시 칠해야 하는 구역의 번호입니다.
    - section에서 같은 원소가 두 번 이상 나타나지 않습니다.
    - section의 원소는 오름차순으로 정렬되어 있습니다.

 */

func solution42(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var count = 0
    var paintedEnd = 0
    
    for i in section {
        if i > paintedEnd {
            paintedEnd = i + m - 1
            count += 1
        }
    }
    return count
}

/*:
 ## 설명
 - section 배열을 앞에서부터 순회하면서, 현재 구역(i)이 이미 칠해진 범위(paintedEnd)보다 크면 롤러질이 필요함
 - 롤러는 m미터를 연속으로 칠할 수 있으므로, 해당 구역부터 i + m - 1 까지 칠해진 것으로 간주
 - 새로 칠할 때마다 count를 증가시킴
 - 이미 칠해진 범위 안에 있는 구역은 추가로 칠하지 않고 넘어감
 - 전체 section을 한 번만 순회하므로 시간 복잡도는 O(n)
 */


func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    
    for word in goal {
        if cards1.first == word {
            cards1.removeFirst()
        } else if cards2.first == word {
            cards2.removeFirst()
        } else {
            return "No"
        }
    }
    return "Yes"
}


/*:
 ## 📌 간단한 논리 연산
 MARK: 간단한 논리 연산
 
 - boolean 변수 x1, x2, x3, x4가 매개변수로 주어질 때, 다음의 식의 true/false를 return 하는 solution 함수를 작성해 주세요.
    - (x1 ∨ x2) ∧ (x3 ∨ x4)


 ### 🔹 문제 설명
 * (x1 ∨ x2) ∧ (x3 ∨ x4)
 * Swift 문법으로는 (x1 || x2) && (x3 || x4)으로 표현

 ### 🔹 조건
 - 'x1', 'x2', 'x3', 'x4'는 모두 'Bool' 타입
 - 연산은 OR('||')와 AND('&&')로 구성되어 있음
     - '||'는 논리합: 둘 중 하나라도 'true'면 'true'
     - &&는 논리곱: 둘 다 'true'일 때만 'true'

 ### 🔹 반환값
 - 전체 논리식의 결과인 'true' 또는 'false'를 return

 ### 🔹 입출력 예시

 | x1    | x2    | x3    | x4    | 결과     |
 |-------|-------|-------|-------|----------|
 | false | true  | true  | true  | true     |
 | true  | false | false | false | false    |

 ### 🔹 예시 설명
 1. 첫 번째 줄:
    '(false || true) && (true || true)' → 'true && true' → 'true' 반환

 2. 두 번째 줄:
    '(true || false) && (false || false)' → 'true && false' → 'false' 반환
*/


func solution(_ x1:Bool, _ x2:Bool, _ x3:Bool, _ x4:Bool) -> Bool {
    return (x1 || x2) && (x3 || x4)
}
