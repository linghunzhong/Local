function shopping_commend_show(){
   var arrow=document.querySelector("#shopping_commend_arrow");
   var imgpath=arrow.getAttribute("src");
/*   if(imgpath=="images/shopping_arrow_up.gif"){
       shopping_commend_arrow.setAttribute("src","images/shopping_arrow_down.gif");
   }else{
       shopping_commend_arrow.setAttribute("src","images/shopping_arrow_up.gif") ;
   }*/
   var shopping_commend_sort=document.querySelector("#shopping_commend_sort");
   if(shopping_commend_sort.style.display=="block"){
       shopping_commend_sort.style.display="none";
       arrow.setAttribute("src","images/shopping_arrow_down.gif")
   }else{
       shopping_commend_sort.style.display="block";
       arrow.setAttribute("src","images/shopping_arrow_up.gif") ;
   }
}
/*
//第一种情况用id
function productOver(id) {
    var  target=document.querySelector("#"+id);
    target.style.backgroundColor="#fff";
}
function productOut(id) {
    var  target=document.querySelector("#"+id);
    target.style.backgroundColor="#fefbf2";
}
function deleteProduct(id) {
    var  target=document.querySelector("#"+ id);
    var flag=confirm("确定要删除本产品吗？");
    if(!flag) return;
    target.parentNode.removeChild(target);
}*/
//第二种情况用class
onload=function () {
    var shopping_product_list=document.querySelectorAll(".shopping_product_list");
    var blue=document.querySelectorAll(".blue");
    for(var i=0;i<shopping_product_list.length;i++){
        shopping_product_list[i].onmouseover=function () {
            this.style.backgroundColor="#fff";
        }
        shopping_product_list[i].onmouseout=function () {
            this.style.backgroundColor="#fefbf2";
        }
        var a=shopping_product_list[i].querySelector(".shopping_product_list_6 a")
        a.onclick=function () {
            var flag=confirm("确定要删除本产品吗？");
            if(!flag){return};
            var tr=this.parentNode.parentNode;
            tr.parentNode.removeChild(tr);
            count();
        }
        shopping_product_list[i].querySelector("input").onchange=function () {
            count();
        }
    }
    count();
 /*   for(var i=0;i<blue.length;i++){
        blue[i].onclick=function () {
            var flag=confirm("确定要删除本产品吗？");
            if(!flag) return;
            var tr=this.parentNode.parentNode;
            tr.parentNode.removeChild(tr);
        }
    }*/
}
function count() {
    var totalPrice=0;//商品金额总计
    var saveAmount=0;//节省金额
    var totalIntegral=0;//商品积分
    var shopping_product_list=document.querySelectorAll(".shopping_product_list");
    for(var i=0;i<shopping_product_list.length;i++){
        var Integral=shopping_product_list[i].querySelector(".shopping_product_list_2 label").innerHTML;
        var marketPrice=shopping_product_list[i].querySelector(".shopping_product_list_3 label").innerText;
        var dangPrice=shopping_product_list[i].querySelector(".shopping_product_list_4 label").innerText;
        var number=shopping_product_list[i].querySelector(".shopping_product_list_5 input").value;
        totalPrice+=parseFloat(dangPrice)*number;
        saveAmount+=(parseFloat(marketPrice)-parseFloat(dangPrice))*number;
        totalIntegral+=parseFloat(Integral)*number;
    }
    totalIntegral=handleDecimal(totalIntegral);
    saveAmount=handleDecimal(saveAmount);
    totalPrice=handleDecimal(totalPrice);
    var product_total=document.getElementById("product_total");
        product_total.innerText=totalPrice;
    var product_save=document.getElementById("product_save");
       product_save.innerHTML=saveAmount;
    var product_integral=document.getElementById("product_integral");
    product_integral.innerHTML=totalIntegral;


}
function handleDecimal(num) {
    return parseInt(num*100)/100;

}
























