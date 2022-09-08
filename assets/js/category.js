 /***** 카테고리 *****/
 let filter = function(){
    // 선택한 카테고리가 있을때만 실행
    if($(".last-nav-td").children().length != 0){
        
        let choiceCate = []; // 선택한 카테고리 배열
        let cate;              // 상품 카테고리 배열

        let result = 0;      // 결과값
                            
        // 클릭한 카테고리를 배열로 만들기
        $(".last-nav-td").children().each(function(index,item){
            
            // 클릭한 3분류 카테고리와
            let singleCategory = item.innerHTML;
            choiceCate.push(singleCategory);
        });
        
        // 상품 하나의 카테고리를 배열로 만들기
        $(".pCategory").each(function(index,item){
            
            // product가 갖고 있는 카테고리
            cate = item.value.split(",");
            
            // 상품 카테고리 배열 <=> 선택한 카테고리 배열 비교
            for(var i = 0; i < choiceCate.length; i++){
                console.log("선택한 카테고리 : " + choiceCate[i]);
                for(var j = 0; j < cate.length; j++){
                    console.log(i + "번 상품의 " + j + "번째 카테고리" + cate[j]);
                    if(cate[j] == choiceCate[i]){
                        result++;
                    }
                }
            }
            
            console.log(result);
            
            // 선택한 카테고리의 갯수와 result를 비교, 같으면 전체 카테고리가 전부 포함되어 있는 것이므로 off 클래스 제거
            if(result == $(".last-nav-td").children().length){
                $(this).parent().removeClass('off');
            }
            // 같지 않다면 카테고리가 1개라도 부족하므로 off 클래스 추가
            else{
                $(this).parent().addClass('off');
            }
            
            // 결과값 초기화
            result = 0;
        });
    }                
    // 선택한 필터가 아무것도 없을 때 off를 지워서 전체가 보일 수 있도록 한다.
    else{
        $(".pCategory").parent().removeClass('off');
    }
}
/***** 카테고리 *****/
