clear
clc


curcar=0; %현재 내부 차량 수
carsnum="car"; %스트링 배열 생성을 위한 사전선언
while 1
    io=input("주차장에 오신것을 환영합니다.\n요금은 1초 1원입니다.\n입차=1/출차=2\n",'s');
    
    switch io
        case '1' %입차
            if curcar<100 %내부공간이 충분한 경우
                curcar=curcar+1; %차량 대수 증가
                carsintime(curcar)=datetime("now"); %입차 시간 기록
                carsnum(curcar)=input('입차하려는 차량번호를 입력하세요',"s");
                fprintf('어서오십시오\n\n')
                pause(1) %1초 지연
            else %내부공간이 부족한 경우
                fprintf('내부공간이 부족하여 이용할수 없습니다.\n\n')
                pause(1)
            end
            
        case '2' %출차
            outtime=datevec(datetime("now")); %출차시간 기록
            carnum=input('출차하려는 차량번호를 입력하세요.\n',"s");
            carindex=find(carsnum==carnum); %입차기록 로드를위한 기록위치 찾기
            intime=datevec(carsintime(carindex)); %입차시간을 가공을위해 형변경
            
            charge=floor(etime(outtime,intime)); %초로구한시간, 요금으로 활용
            pay=1; %결제판독용
            if isempty(carindex) %입차기록이 없을경우 처리
                disp('해당하는 차량번호가 존재하지 않습니다')
            else %결제및 출차 과정
                while pay==1
                    pay=project_payment(charge); %결제함수 호출
                end
                carsnum(carindex)=[];
                carsintime(carindex)=[];
                curcar=curcar-1;
                %입차 목록에서 차량 제거
            end
            fprintf('안녕히 가십시오.\n\n');
            pause(1)
            
        case '346765' %종료
            disp('프로그램을 종료합니다')
            break;
        otherwise
            disp('잘못된 입력입니다')
    end
end