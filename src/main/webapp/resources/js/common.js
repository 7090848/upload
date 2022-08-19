
// 날짜 format
function formatDate(date) {
	let d = new Date(date);
	year = '' + d.getFullYear();
	month = '' + (d.getMonth() + 1);
	day = '' + d.getDate();
	
	if(month.length < 2)
		month = '0' + month;
	if(day.length < 2) {
		day = '0' + day;
	}
	return year + "년 " + month + "월 " + day + "일";
}


// 원 표시 자동변환 script
   function changeMoneyUnit() {
       var moneyValue = document.querySelectorAll(".money");
       const moneyUnit = "원"
       var regex = /[^0-9]/g;
       for(i of moneyValue){
           result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
           result = result.concat(moneyUnit);
           i.innerText = result;
       };
   };