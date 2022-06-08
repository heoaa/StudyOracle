--hr(비활성화된 사용자)을 해제(사용할 수 있도록 활성화)
alter user hr account unlock;

--hr 비밀번호 설정
alter user hr identified by "hr1234";

--hr의 MyOracle 권한 설정
grant connect, resource, dba to hr;

--전체 한번에 실행 : 스크립트 실행(F5)