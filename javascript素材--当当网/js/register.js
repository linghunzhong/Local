function emailFocus() {
    var email_prompt=document.querySelector("#email_prompt");
    var email=document.querySelector("#email") ;
    email.classList.add("register_input_Focus");
    email.classList.remove("register_input_Blur");
    email_prompt.innerHTML="此邮箱是您用来登入当当的账号，并用来接收邮件";
    email_prompt.className="register_prompt";
}
function emailBlur() {
    var email_prompt=document.querySelector("#email_prompt");
    var email=document.querySelector("#email") ;
    var regEmail=/\w+@\w+(\.\w+){1,2}$/;
    email.classList.add("register_input_Blur");
    email.classList.remove("register_input_Focus");
    if(regEmail.test(email.value)){
        email_prompt.className="register_prompt_ok";
        email_prompt.innerHTML="";
    }else{
        email_prompt.className="register_prompt_error" ;
        email_prompt.innerHTML="请输入正确的邮箱格式";
    }
}
function nickNameFocus() {
var nickName_prompt=document.querySelector("#nickName_prompt");
var nickName=document.querySelector("#nickName");
nickName.classList.add("register_input_Focus");
nickName.classList.remove("register_input_Blur");
nickName_prompt.className="register_prompt";
nickName_prompt.innerHTML="昵称可由大小写英文字母、数字组成，长度6-20个字符"
}
function nickNameBlur() {
    var nickName_prompt=document.querySelector("#nickName_prompt");
    var nickName=document.querySelector("#nickName");
    var regNickName=/^([A-Za-z0-9]+){6,20}$/;
    var reg=/[A-Za-z]+/;
    if(regNickName.test(nickName.value)&&nickName.value.match(reg)){
        nickName_prompt.className="register_prompt_ok";
        nickName_prompt.innerHTML="";
    }else{
        nickName_prompt.className="register_prompt_error";
        nickName_prompt.innerHTML="昵称为必填项，请输入您的昵称"
    }
}
function pwdFocus() {
    var pwd_prompt=document.querySelector("#pwd_prompt");
    var pwd=document.querySelector("#pwd");
    pwd.classList.add("register_input_Focus");
    pwd.classList.remove("register_input_Blur");
    /*pwd.classList.add("register_input_Focus");
    pwd.classList.remove("register_input_Blur");*/
    pwd_prompt.className="register_prompt";
    pwd_prompt.innerHTML="密码可由大小写英文字母、数字组成，长度6-20个字符"

}
function pwdBlur() {
    var pwd_prompt=document.querySelector("#pwd_prompt");
    var pwd=document.querySelector("#pwd");
    var regPwd=/^([A-Za-z0-9]+){6,20}$/;
    pwd.classList.add("register_input_Blur");
    pwd.classList.remove("register_input_Focus");
    if(regPwd.test(pwd.value)){
        pwd_prompt.className="register_prompt_ok";
        pwd_prompt.innerHTML="";
    }else{
        pwd_prompt.className="register_prompt_error";
        pwd_prompt.innerHTML="密码为必填项，请输入您的密码"
    }
}
function repwdFocus() {
    var repwd_prompt=document.querySelector("#repwd_prompt");
    var repwd=document.querySelector("#repwd");
    repwd.classList.add("register_input_Focus");
    repwd.classList.remove("register_input_Blur");
    repwd_prompt.className="register_prompt";
    repwd_prompt.innerHTML="请再次输入您的密码"


}
function repwdBlur() {
    var repwd_prompt=document.querySelector("#repwd_prompt");
    var repwd=document.querySelector("#repwd");
    var pwd=document.querySelector("#pwd");
    repwd.classList.add("register_input_Blur");
    repwd.classList.remove("register_input_Focus");
    if(repwd.value==pwd.value && repwd.value!=""){
        repwd_prompt.className="register_prompt_ok";
        repwd_prompt.innerHTML="";
    }else{
        repwd_prompt.className="register_prompt_error";
        repwd_prompt.innerHTML="请再次输入您的密码"
    }
}
var regionList=[];
regionList["广东省"]=['广州市','深圳市','汕头市','惠州市','珠海市','揭阳市','佛山市','河源市','阳江市','茂名市','湛江市','梅州市','肇庆市','韶关市','潮州市','东莞市','中山市','清远市','江门市','汕尾市','云浮市'];
regionList["福建省"]=['福州市','厦门市','泉州市','三明市','南平市','漳州市','莆田市','宁德市','龙岩市'];
regionList["海南省"]=['海口市','三亚市'];
regionList["四川省"]=['成都市','绵阳市','德阳市','广元市','自贡市','攀枝花市','乐山市','南充市','内江市','遂宁市','广安市','泸州市','达州市','眉山市','宜宾市','雅安市','资阳市'];
regionList["湖南省"]=['长沙市','株洲市','湘潭市','衡阳市','岳阳市','郴州市','永州市','邵阳市','怀化市','常德市','益阳市','张家界市','娄底市'];
regionList["江西省"]=['南昌市','九江市','赣州市','吉安市','鹰潭市','上饶市','萍乡市','景德镇市','新余市','宜春市','抚州市'];
regionList["台湾省"]=['台北市','台中市','基隆市','高雄市','台南市','新竹市','嘉义市'];
regionList["云南省"]=['昆明市','曲靖市','玉溪市','保山市','昭通市','丽江市','普洱市','临沧市'];
regionList["浙江省"]=['杭州市','嘉兴市','湖州市','宁波市','金华市','温州市','丽水市','绍兴市','衢州市','舟山市','台州市'];
regionList["江苏省"]=['南京市','镇江市','常州市','无锡市','苏州市','徐州市','连云港市','淮安市','盐城市','扬州市','泰州市','南通市','宿迁市'];
onload=function () {
    var selectProvince=document.querySelector("#province");
    for(var i in regionList) {
        var option = document.createElement("OPTION");
        option.value = i;
        option.innerHTML = i;
        selectProvince.appendChild(option);
    }

}
function changeCity() {
    var selectProvince=document.querySelector("#province");
    var selectCity=document.querySelector("#city");
    selectCity.innerHTML="<option>请选择城市/地区</option>";
    for(var i in regionList[selectProvince.value]){
        var option = document.createElement("OPTION");
        option.value = regionList[selectProvince.value][i];
        option.innerHTML = regionList[selectProvince.value][i];
        selectCity.appendChild(option);
    }
}
function btn_over() {
    var registerBtn=document.querySelector("#registerBtn");
    registerBtn.setAttribute("src","images/register_btn_over.gif")

}
function btn_out() {
    var registerBtn=document.querySelector("#registerBtn");
    registerBtn.setAttribute("src","images/register_btn_out.gif")

}








