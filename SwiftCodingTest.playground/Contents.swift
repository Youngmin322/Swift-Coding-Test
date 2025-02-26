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


