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

func solution(_ my_string: String, _ index_list: [Int]) -> String {
    let char = Array(my_string)  // 문자열을 문자 배열로 변환
    return index_list.map { String(char[$0]) }.joined()
}

/*:
 ## 예제 실행
 */

let my_string1 = "cvsgiorszzzmrpaqpe"
let index_list1 = [16, 6, 5, 3, 12, 14, 11, 11, 17, 12, 7]
solution(my_string1, index_list1)  // "programmers"

let my_string2 = "zpiaz"
let index_list2 = [1, 2, 0, 0, 3]
solution(my_string2, index_list2)  // "pizza"

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

func solution(_ my_str: String, _ n: Int) -> [String] {
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

print(solution("abc1Addfggg4556b", 6)) // ["abc1Ad", "dfggg4", "556b"]
print(solution("abcdef123", 3)) // ["abc", "def", "123"]
print(solution("helloWorld", 4)) // ["hell", "oWor", "ld"]

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

func solution(_ quiz:[String]) -> [String] {
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

func solution(_ common:[Int]) -> Int {
    
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

