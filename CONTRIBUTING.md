# Contributing

## Guideline

1. `main` 브랜치는 최종본만 업로드합니다.
2. `dev` 브랜치에 실질적으로 필요한 모든 코드를 업로드합니다. 기능 개발, 실험은 feat-{기능명}(ex. feat-path_planning)과 같은 브랜치를 만들어서 push하고 완성되면 dev에 merge합니다.
3. pep20 준수. https://zetawiki.com/wiki/PEP_20_-_%EC%A0%A0_%EC%98%A4%EB%B8%8C_%ED%8C%8C%EC%9D%B4%EC%8D%AC
4. git commit convention
    - fix : 버그 패치
    - feat : 기능 추가
    - style : 기능 변경 없이 간단한 변수명, 파일명, 경로변경 등의 작업
    - BREAKING CHANGE : 커다란 API의 변경
    - HOTFIX : 급하게 큰 에러의 수정한 경우
    - refactor : 기능 변경 없이 레거시를 리팩터링하는 거대한 작업
    - docs : 기능 변경 없이 문서 및 주석 수정 (코드 수정 X)
    - remove : 삭제
    - first commit
    - chore : gitignore와 같은 빌드, 패키지 수정

5. __commit message__
    ```text
    <convention>: 한 줄 설명(이슈링크) -> 명령어 사용, 점(.)X
    # 한 줄 띄우기
    - <커밋에 대한 본문 설명>

    ```

    `example`
    ```text
    feat: path planning 기능 구현 (#102)

    - load.py의 DB에서 데이터를 받아오는 부분의 에러를 수정
    - main.py에서 load.py의 함수를 호출하는 부분 수정
    ```

6. __PR__ 은 기능 구현 단위로 작성해서 보내기. (이슈 역시 기능 단위)

7. __ISSUE__ 는 상황에 맞는 이슈 템플릿 사용

8. 변수 / 메소드명 선언 규칙

    1. 변수의 이름은 대소문자를 혼용할 수 있지만 반드시 소문자로 시작한다. 
    ex. scrum, acount, eventHandler
    
    2. 상수는 모두 대문자로 지정하되, _ 를 사용하여 단어들을 구분한다. 
    ex. MAX_VELOCITY, MAX_STEERING
    
9. 최적화 보다는 가독성