![LookMonster-3](https://github.com/LookMonster/LookMonster-iOS/assets/102890390/ef13b89a-e601-44be-9544-2bee1fce2c05)

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FLookMonster%2FLookMonster-iOS&count_bg=%230D0D0D&title_bg=%23000000&icon=&icon_color=%23FFFFFF&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

### LookMonster-iOS 프로젝트 시작 방법
- 🐻 터미널을 열고 아래 명령어를 차례로 실행하여 "monster" 명령어를 등록해주세요!
    
    ```Swift
    cp monster.sh /usr/local/bin/monster
    chmod +x /usr/local/bin/monster
    ```
    
- 🐻‍❄️ 아래 명령어를 실행해주시면 프로젝트를 실행할 준비가 되었습니다!
    
    ```Swift
    monster generate
    ```
## **RIB 추가 방법**
- 💪🏿 터미널을 열고 아래 명령어를 넣어주세요
   - 추가하고 싶은 RIB
   - 추가하고 싶은 경로
   - 받아야하는 인터페이스
    ```Swift
   sh monster_create_rib.sh \(추가하고 싶은 RIB 이름) "/Users/\(user_name)/Desktop/LookMonster/LookMonster-iOS/Features/User/Main/Community/CommunityUserInterface/Implement/AppCommunityImpl/Views" \(받아야하는 인터페이스)

   ex) sh monster_create_rib.sh Question "/Users/junha/Desktop/LookMonster/LookMonster-iOS/Features/User/Main/Community/CommunityUserInterface/Implement/AppCommunityImpl/Views" Community
    ```
