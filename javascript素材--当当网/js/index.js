var imgs=["images/dd_scroll_1.jpg",
    "images/dd_scroll_2.jpg",
    "images/dd_scroll_3.jpg",
    "images/dd_scroll_4.jpg",
    "images/dd_scroll_5.jpg",
    "images/dd_scroll_6.jpg"];
var minNumber=1;
var maxNumber=6;
function loopShow(num) {
    if(num){
        minNumber=parseInt(num);
    }
    var img=document.querySelector("#dd_scroll");
    img.setAttribute("src",imgs[minNumber-1]);
    var scroll_number=document.querySelectorAll("#scroll_number li");
       for (var i=0;i<scroll_number.length;i++){
           scroll_number[i].className="scroll_number_out";
       }
    scroll_number[minNumber-1].className="scroll_number_over";
    minNumber++;
    if(minNumber>maxNumber){
        minNumber=1;
    }
}
onload=function () {
    setInterval(loopShow, 1000)//设置时间滚动

    var bookSortBtn = document.querySelectorAll(".book_sort .book_type");
    var doors = document.querySelectorAll(".book_class dl");
    for (var i = 0; i < bookSortBtn.length; i++) {
        bookSortBtn[i].index = i;
        bookSortBtn[i].onmouseover = function () {
            this.className = "book_type_out";
            for (var j = 0; j < doors.length; j++) {
                if (this.index == j)
                    doors[j].className = "book_show";
                else
                    doors[j].className = "book_none";
            }
        }
        bookSortBtn[i].onmouseout = function () {
            this.className = "book_type";
        }
    }
    var dome=document.querySelector("#dome");
    var dome1=document.querySelector("#dome1");
    var dome2=document.querySelector("#dome2");
    dome2.innerHTML=dome1.innerHTML;
     function mevoup() {
             dome.scrollTop++;//scroll Top:滚动前；scrollTop：特性；相当于在滚动顶端
          if(dome.scrollTop>dome1.offsetHeight){  //offsetHeight:偏移高度
           /*  alert(dome.scrollTop+"<br/>");//1041
              alert(dome1.offsetHeight+"<br/>");//1040*/
              dome.scrollTop=0;
          }
     }
     var interval=setInterval(mevoup,5);
    dome.onmouseover=function () {
        clearInterval(interval);
    }
    dome.onmouseout=function () {
        interval=setInterval(mevoup,5);
    }
    var shutAd=document.querySelector("#shutAd");
    var right=document.querySelector("#right");
    shutAd.onclick=function () {
        right.style.display="none";
    }
   window.open("http://www.baidu.com","","height:500 ,width:300")
}

