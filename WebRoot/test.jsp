<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>css3 animation小动画 </title>
        <style>
        body{
background:url(img/wel.jpg);
}
         .box1{
                height:120px;
                width:120px;
                position:relative;
                left:-100px;
                line-height:100px;
                text-align: center;
                color:#fff;
                font-size:25px;
                font-family: Arial, Helvetica, sans-serif;
                background:yellow;
                animation: move1 7s linear infinite reverse;
            }
            
            
             @keyframes move1{
                0%{
                    left: -100px;
                    top:300px;
                    transform: scale(1.1) rotate(200deg);
                }
                30%{
                    left: 500px;
                    top:100px;
                    transform: scale(1.3) rotate(120deg);
                }
                50%{
                    left: 650px;
                    top:100px;
                    transform: scale(1.5) rotate(280deg);
                }
                70%{
                    left: 800px;
                    top:400px;
                    transform: scale(1.3) rotate(40deg);
                }
                100%{
                    left:200px;
                    top:600px;
                    transform: scale(1) rotate(60deg);
                }
            }
            
            
            .box2{
                height:200px;
                width:200px;
                position:relative;
                left:50%;
             
                line-height:100px;
                text-align: center;
                color:#fff;
                font-size:25px;
                font-family: Arial, Helvetica, sans-serif;
                background:red;
                animation: move2 6s linear infinite reverse;
            }
            
            
             @keyframes move2{
                0%{
                    right: 400px;
                    top:800px;
                    transform: scale(1.1) rotate(200deg);
                }
                30%{
                    right: -200px;
                    top:100px;
                    transform: scale(1.1) rotate(120deg);
                }
                50%{
                    left: 450px;
                    top:100px;
                    transform: scale(1.7) rotate(280deg);
                }
                70%{
                    left: 700px;
                    top:400px;
                    transform: scale(1.9) rotate(40deg);
                }
                100%{
                    left:-200px;
                    top:900px;
                    transform: scale(1) rotate(60deg);
                }
            }
            
        
            .box{
                height:156px;
                width:156px;
                position:relative;
                left:-100px;
                line-height:100px;
                text-align: center;
                color:#fff;
                font-size:25px;
                font-family: Arial, Helvetica, sans-serif;
                background:blue;
                animation: move 5s linear infinite reverse;
            }
            .wrap{
                width:1000px;
                height:150px;

            }
            @keyframes move{
                0%{
                    left: -100px;
                    top:300px;
                    transform: scale(1.1) rotate(200deg);
                }
                30%{
                    left: 500px;
                    top:100px;
                    transform: scale(1.3) rotate(120deg);
                }
                50%{
                    left: 550px;
                    top:100px;
                    transform: scale(1.5) rotate(280deg);
                }
                70%{
                    left: 400px;
                    top:100px;
                    transform: scale(1.3) rotate(40deg);
                }
                100%{
                    left:-200px;
                    top:200px;
                    transform: scale(1) rotate(60deg);
                }
            }
        </style>
    </head>
    <body>
        <div class="wrap" style="left:40% top:20%">
            <div class="box">欢迎登录</div>
        </div>
        <div class="wrap">
            <div class="box1" style="left:50%">欢迎登录</div>
        </div>
         <div class="wrap" style="left:30%">
            <div class="box2">欢迎登录</div>
        </div>

    </body>

</html>
