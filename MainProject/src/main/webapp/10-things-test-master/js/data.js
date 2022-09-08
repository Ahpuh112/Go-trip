const qnaList = [
  {
    q: '1. 여행을 떠날떄 계획은?',
    a: [
      { answer: 'a. 계획은 필수', score: 3 },
      { answer: 'b. 내가 걷는 길이 곧 여행코스', score: 5 },
      
    ]
  },
  {
    q: '2. 여행 경비는?',
    a: [
      { answer: 'a. 돌아 갈 차비만 있으면 돼', score: 7 },
      { answer: 'b. 걸아다니는 계산기', score: 5 },
 
    ]
  },
  {
    q: '3. 여행을 다녀온 후?',
    a: [
      { answer: 'a. 가방을 열고 물건을 정리한다', score: 8 },
      { answer: 'b. 일단 좀 쉬자', score: 6 },
    ]
  },
  {
    q: '4. 여행지에서 식사할 떄 ',
    a: [
      { answer: 'a. 유명한 맛집을 찾아보고 간다', score: 3 },
      { answer: 'b. 일단 보이는데 들어간다', score: 4 },
    ]
  },
  {
    q: '5. 화려하고 멋진 건축물을 보았을떄 드는 생각은?',
    a: [
      { answer: 'a. 저건 어떻게 지었을까 생각한다 ', score: 8 },
      { answer: 'b. "오 멋있네" 감탄한다', score: 6 },
    ]
  },
  {
    q: '6. 아침에 늦잠 잔 친구에게',
    a: [
      { answer: 'a. 그럴수 있지~ ', score: 5 },
      { answer: 'b. 내일은 시간 잘 지키자', score: 3 },
    ]
  },
  {
    q: '7. 숙소를 구할 때',
    a: [
      { answer: 'a. 사람많은 파티 분위기 ', score: 6 },
      { answer: 'b. 조용하고 아늑한 곳', score: 2 },
    ]
  },
  {
    q: '8. 여행 기념 선물을 고르게 된 나는',
    a: [
      { answer: 'a. 실용성은 없어도 예쁘고 기억에 남을 선물', score: 8 },
      { answer: 'b. 그래도 필요할거 같은 선물', score: 9 },
    ]
  },
  {
    q: '9. 여행 예능을 보다가 가고싶은 여행지를 발견했을 때',
    a: [
      { answer: 'a. 같이 갈 사람을 모집한다', score: 7 },
      { answer: 'b. 떠나는 상상을 하며 설레한다', score: 6 },
    ]
  },
  {
    q: '10. 여행지에 대한 감상을',
    a: [
      { answer: 'a. 말로 내뱉어야 직성이 풀린다 ', score: 6 },
      { answer: 'b. 마음속에 혼자 간직한다', score: 4 },
    ]
  }
]

const infoList = [
  {
    from: 10,
    to: 20,
    mLeft: '10%',
    name: '광주',
    desc: '당신은 현실에 구애 받지 않는 자유로운 타입입니다. 도시 속에서도 다양한 명소를 즐길 수 있는 광주를 추천합니다',
    text: '✈ 광주 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=5&pageNum=1'
  },
  {
    from: 21,
    to: 30,
    mLeft: '25%',
    name: '부안',
    desc: '당신은 끈기가 넘치고 의지가 강한 타입입니다. 잠시 내려놓고 휴식을 취할 수 있는 부안을 추천합니다',
    text: '✈ 부안 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=16&pageNum=1'
  },
  {
    from: 31,
    to: 40,
    mLeft: '40%',
    name: '담양',
    desc: '당신은 안정감 있는 상황을 좋아하는 타입입니다. 마음의 평화를 얻을 수 있는 담양을 추천합니다 ',
    text: '✈ 담양 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=11&pageNum=1'
  },
  {
    from: 41,
    to: 50,
    mLeft: '55%',
    name: '목포',
    desc: '당신은 인싸기질과 낙천적인 사고를 타고난 타입입니다.밝은 햇살과 낙천적인 기운이 가득한 목포를 추천합니다',
    text: '✈ 목포 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=12&pageNum=1'
  },
  {
    from: 51,
    to: 60,
    mLeft: '70%',
    name: '순천',
    desc: '당신은 빠른 판단력을 가진 타입입니다 예측 불가능한 여행의 기쁨이 기다리는 순천을 추천합니다.',
    text: '✈ 순천 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=18&pageNum=1'
  },
  {
    from: 61,
    to: 70,
    mLeft: '85%',
    name: '여수',
    desc: '당신은 활동적이고 에너지가 넘치는 타입입니다. 가지고 있는 에너지를 두 배로 올려줄 여수를 추천합니다',
    text: '✈ 여수 여행정보 보기 ✈',
    href: '../tripInfo.jsp?locNum=19&pageNum=1'
  }
]