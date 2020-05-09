//计时器
var settime;
var onesecond = 1000;
var secondnum = 0, minutenum = 0, hournum=0;
var ori_second, ori_minute, ori_hour;
var flag = 0;   //before count
var mode = 0;   //
var movedirection = 0;
var starttime = new String;


//only display
var second = document.getElementById('second');
var minute = document.getElementById('minute');
var hour = document.getElementById('hour');
var hourlabel = document.getElementById("hourlabel");
var minutelabel = document.getElementById("minutelabel");
var secondlabel = document.getElementById("secondlabel");
var hint = document.getElementById("hint");
//display; onclick;
var countup = document.getElementById("countup");
var countdown = document.getElementById("countdown");
var clear = document.getElementById("clear");
var restart = document.getElementById("restart");
var resume = document.getElementById("resume");
var pause = document.getElementById("pause");
var timer = document.getElementById("time");

function adjustnum(number, ishour) {    //R -> [0,59]
    number = Number(number);        //string
    number = Math.floor(number);    //float
    if (isNaN(number)) {            //NaN
        number = 0;
    }
    else if (ishour) {
        if (number < 0)
            number = 0;
    } else {
        if (number > 0) {
            if (number > 59)
                number = 59;
        } else 
            number = 0;
    }
    return number;
}
function gentime(th, tm, ts) {
    var temp = new String;
    if (th < 10) {
        temp+= "0";
        temp+= th;
    } else
        temp+= th;
    temp+= ":";
    if (tm < 10) {
        temp+= "0";
        temp+= tm;
    } else
        temp+= tm;
    temp+= ":";
    if (ts < 10) {
        temp+= "0";
        temp+= ts;
    } else
        temp+= ts;
    return temp;
}
function displaytime() {
    var temp = gentime(hournum, minutenum, secondnum);
    timer.innerText = temp;    
}
function displayhint() {
    if (flag == 0) {         //only excute once per timer
        //adjust origin number
        ori_second = second.value;
        ori_minute = minute.value;
        ori_hour = hour.value;
        ori_second = adjustnum(ori_second, 0);
        ori_minute = adjustnum(ori_minute, 0);
        ori_hour = adjustnum(ori_hour, 1);
        //change starttime
        starttime = gentime(ori_hour, ori_minute, ori_second);
        //change clear text
        if (movedirection == 0)
            clear.value = "清空正计时";
        else
            clear.value = "清空倒计时"
        flag = 1;
    }
    switch (mode) {
        case 1:     //counting
            if (movedirection == 0)
                hint.innerText = "正在正计时 " + starttime;
            else
                hint.innerText = "正在倒计时 " + starttime;
            break;
        case 2:     //pausing
            if (movedirection == 0)
                hint.innerText = "暂停正计时 " + starttime;
            else
                hint.innerText = "暂停倒计时 " + starttime;
            break;
        case 3:     //end
            if (movedirection == 0)
                hint.innerText = "正计时 " + starttime + " 不可能结束";
            else
                hint.innerText = "倒计时 " + starttime + " 已结束";
            break;
    }
}

function startCount() {
    if (flag == 0) {      //before count, reset
        secondnum = ori_second;
        minutenum = ori_minute;
        hournum = ori_hour;
        flag = 1;
    }
    //time has gone
    if (movedirection == 0) {
        if ( secondnum + 1 == 60 ) {
            secondnum = 0;
            minutenum++;
        } else
            secondnum++;
        if ( minutenum + 1 == 60 ) {
            minutenum = 0;
            hournum++;
        } 
    } else {
        if ( secondnum  == 0 && minutenum > 0 ) {
            secondnum = 60 - 1;
            minutenum--;
        } else if (secondnum > 0)
            secondnum--;
        if ( minutenum == 0 && hournum > 0 ) {
            minutenum = 60 - 1;
            hournum--;
        }
        if (secondnum == 0 && minutenum == 0 && hournum == 0) {
            pause.style.display = "none";
            resume.style.display = "none";
            mode = 3;
            displayhint();
            clearTimeout(settime);
        }
    }
    // time has changed, display
    displaytime();
    settime = setTimeout("startCount()",onesecond);
}
countup.onclick = countupclick;

function countupclick() {      //from mode 0
    mode = 1;
    movedirection = 0;      //up

    hour.style.display = "none";
    minute.style.display = "none";
    second.style.display = "none";
    hourlabel.style.display = "none";
    minutelabel.style.display = "none";
    secondlabel.style.display = "none";
    countup.style.display = "none";
    countdown.style.display = "none";
    hint.style.display = "block";
    pause.style.display = "block";
    restart.style.display = "block";
    clear.style.display = "block";
    
    //flag 0, read
    displayhint();
    flag = 0;
    //reset
    startCount();
}
countup.onclick = countupclick;

function countdownclick() {        //from mode 0
    mode = 1;
    movedirection = 1;      //down

    hour.style.display = "none";
    minute.style.display = "none";
    second.style.display = "none";
    hourlabel.style.display = "none";
    minutelabel.style.display = "none";
    secondlabel.style.display = "none";
    countup.style.display = "none";
    countdown.style.display = "none";
    hint.style.display = "block";
    pause.style.display = "block";
    restart.style.display = "block";
    clear.style.display = "block";
    
    //flag 0, read
    displayhint();
    flag = 0;   
    //reset
    startCount();
}   
countdown.onclick = countdownclick;

function pauseclick() {        //from mode 1
    mode = 2;

    pause.style.display = "none";
    resume.style.display = "block";

    displayhint();
    clearTimeout(settime);
}
pause.onclick = pauseclick;

function resumeclick() {       //from mode 2
    mode = 1;

    resume.style.display = "none";
    pause.style.display = "block";
    
    displayhint();
    startCount();
}
resume.onclick = resumeclick;


restart.onclick = function() {       //from mode 1,2,3
    mode = 1;
    //stop first, start then
    clearTimeout(settime);

    resume.style.display = "none";
    pause.style.display = "block";
    
    displayhint();
    flag = 0;       
    //need reset
    startCount();
}

clear.onclick = function() {         //from mode 1,2,3
    mode = 0;

    hour.style.display = "block";
    minute.style.display = "block";
    second.style.display = "block";
    hourlabel.style.display = "block";
    minutelabel.style.display = "block";
    secondlabel.style.display = "block";
    countup.style.display = "block";
    countdown.style.display = "block";
    hint.style.display = "none";
    pause.style.display = "none";
    resume.style.display = "none";
    restart.style.display = "none";
    clear.style.display = "none";

    flag = 0;       //need read
    movedirection = 0;//default up
    clearTimeout(settime);
    timer.innerText = "00:00:00";
    //wait for count.onclick
}

function keydown() {
    //获取用户单击键盘的“键值”
    var keyCode = window.event.keyCode;
    if (keyCode == 32) {        //pause && resume
        switch (mode) {
            case 1:
                pauseclick();
                break;
            case 2:
                resumeclick();
                break;
        }
    }
    if (keyCode == 13 && mode == 0){ //countup&&dowm
        if (movedirection == 0)
            countupclick();
        else
            countdownclick();
    }
}
document.onkeydown = keydown;
