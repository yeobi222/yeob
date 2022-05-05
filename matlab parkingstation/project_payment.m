function payr=project_payment(charge)
charges=num2str(charge);
payn="non";
while payn~=charges
    fprintf("요금은 %s원 입니다.\n", charges)
    payn=input("요금을 입력하여 납부바랍니다.\n", 's');
    if payn==charges
        disp('결제가 완료되었습니다.')
        payr=0; %결제완료 반환
        break
    else
        disp('결제가 완료되지 않았습니다.다시 시도해 주십시오.')
        payr=1; %결제실패 반환
    end
    pause(1)
end
