 # Mission: 01_wc-lite
 # 텍스트 파일의 라인 수, 단어 수, 문자 수를 세는 `wc` 명령어의 경량 버전을 구현합니다.

 # 요구사항:
 #  - -l: 라인 수 출력
 #  - -w: 단어 수 출력
 #  - -c: 문자 수 출력
 #  - 옵션이 없으면 -l, -w, -c 결과를 모두 출력합니다.

 ############################################################
# 실행 및 테스트 방법 (01_test.sh)
#
# 1. 자동 채점 스크립트 실행 (01_test.sh)
#    ./01_test.sh
#
#    - 예상 출력 예시:
#        === Test wc-lite ===
#        [PASS] -l option (Lines: 3)
#        [PASS] -w option (Words: 7)
#        [PASS] -c option (Chars: 36)
#
# 2. 참고
#    - 01_test.sh 는 내부적으로 ./01_wc-lite.sh 를 호출하여 결과를 비교합니다.
#    - PASS/FAIL 메시지를 통해 정답 여부를 확인할 수 있습니다.
############################################################

#  !! 참가자 솔루션 !!
# 아래에 다른 참가자의 코드를 지우지 말고, 자신의 코드를 추가하세요.
# 충돌 발생 시, 다른 사람의 코드는 남겨두고 본인의 코드를 그 아래에 병합해야 합니다.

# --- 참가자: [Your Name Here] ---
# (여기에 자신의 스크립트 코드를 작성하세요)
# wc_lite_solution_yourname() {
#    Your logic here
#    echo "My solution for wc-lite"
# }

 wc_lite_solution_yourname() {
    echo "Sarah's solution for wc-lite"
 }

 ############################################
 ############################################
 ################## 방어막 ##################
 ############################################
 ############################################
 wc_lite_solution_yschoi() {
    local opt_l=false
    local opt_w=false
    local opt_c=false
    local file=""

    # 옵션 파싱
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -l) opt_l=true; shift ;;
            -w) opt_w=true; shift ;;
            -c) opt_c=true; shift ;;
            *)  file="$1"; shift ;;
        esac
    done

    # 파일 또는 stdin 읽기
    if [[ -n "$file" ]]; then
        input=$(cat "$file")
    else
        input=$(cat)
    fi

    # 기본 옵션 (아무것도 없을 때 전부 출력)
    if ! $opt_l && ! $opt_w && ! $opt_c; then
        opt_l=true; opt_w=true; opt_c=true
    fi

    # 카운트 계산
    line_count=$(echo "$input" | wc -l)
    word_count=$(echo "$input" | wc -w)
    char_count=$(echo "$input" | wc -m)

    # 출력
    $opt_l && echo "Lines: $line_count"
    $opt_w && echo "Words: $word_count"
    $opt_c && echo "Chars: $char_count"
}
 ############################################
 ############################################
 ################## 방어막 ##################
 ############################################
 ############################################

# ---- main dispatcher ----
if declare -f wc_lite_solution_yschoi >/dev/null; then
  wc_lite_solution_yschoi "$@"
elif declare -f wc_lite_solution_yourname >/dev/null; then
  wc_lite_solution_yourname "$@"
fi
