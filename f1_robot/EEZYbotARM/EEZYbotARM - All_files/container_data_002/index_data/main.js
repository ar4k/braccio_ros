var dataStuff = {};
var loopLimit = 2;
var currentLoop = 0;
var stopFrameAnimation = false;
var legalDuration = 4000;

var ctaBtnY = 0;
var cLine1 = {};
var lineLeft = "10px";

function pageLoadedHandler() {
	populateData();
	setListeners();
}

function populateData(){
	// Dynamic Content variables and sample values
    Enabler.setProfileId(1068847);
    var devDynamicContent = {};

    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1= [{}];
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0]._id = 0;
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].ID = 1;
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].MESSAGE_NAME = "OIL";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].BANNER_CODE = "size=300x250||asset=asset-oil.jpg||msg1=Il%20petrolio%20rimarr%E0%20il%20principale%20%3Cfont%20color%3D%27%23e90a09%27%3Emarket%20mover%3C\/font%3E||msg1FS=20||msg2=ProRealTime%20e%20velocit%E0%20d%27esecuzione||msg2FS=20||msg3=||msg3FS=20||ctaBtn=Scopri%20di%20pi%F9||ctaBtnFS=16||disclaimer=||disclaimerFS=12||legal=Messaggio%20pubblicitario%20con%20finalit%E0%20promozionale.%20Il%20trading%20con%20i%20CFD%20pu%F2%20determinare%20perdite%20che%20eccedono%20il%20vostro%20investimento%20iniziale.||legalFS=18||loop=2";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].ALFolder = {"asset-alibaba.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40916851/9542_20160119045022776_asset-alibaba.jpg"},"asset-stopwatch.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40844326/9542_20160113085733196_asset-stopwatch.jpg"},"asset-security.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/39327674/9542_20151020012729418_asset-security.jpg"},"asset-oil.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40446347/9542_20151211035141230_asset-oil.jpg"},"asset-netflix.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40834652/9542_20160113014625040_asset-netflix.jpg"},"asset-etf-edu.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40421976/9542_20151210050056831_asset-etf-edu.jpg"},"asset-etf.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40422806/9542_20151210050050214_asset-etf.jpg"},"asset-bitcoin.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40945787/9542_20160120082522090_asset-bitcoin.jpg"},"asset-apple.jpg":{"Type":"file","Url":"https://s0.2mdn.net/ads/richmedia/studio/40916546/9542_20160119045016705_asset-apple.jpg"}};
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CLICKTHROUGH = {};
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CLICKTHROUGH.Url = "https://www.ig.com";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CTA_CLICKTHROUGH = {};
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CTA_CLICKTHROUGH.Url = "https://www.ig.com";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].START_DATE = {};
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].START_DATE.RawValue = "";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].START_DATE.UtcValue = 0;
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].END_DATE = {};
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].END_DATE.RawValue = "";
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].END_DATE.UtcValue = 0;
    devDynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].DEFAULT = false;
    Enabler.setDevDynamicContent(devDynamicContent);
	
	dataStuff = parseBannerCode(dynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].BANNER_CODE);
    
    var imageUrl = dynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].ALFolder[dataStuff.asset].Url;
    createBG(imageUrl);
    
	
	document.getElementById('line1').lastElementChild.innerHTML = dataStuff.msg1;
	document.getElementById('line1').lastElementChild.style.fontSize = dataStuff.msg1FS+"px";
	document.getElementById('line2').lastElementChild.innerHTML = dataStuff.msg2;
	document.getElementById('line2').lastElementChild.style.fontSize = dataStuff.msg2FS+"px";
	document.getElementById('line3').lastElementChild.innerHTML = dataStuff.msg3;
	document.getElementById('line3').lastElementChild.style.fontSize = dataStuff.msg3FS+"px";

	document.getElementById('cta-btn').lastElementChild.lastElementChild.innerHTML = dataStuff.ctaBtn;
	document.getElementById('cta-btn').style.fontSize = dataStuff.ctaBtnFS+"px";
	document.getElementById('legal').lastElementChild.innerHTML = dataStuff.legal;
	document.getElementById('legal').lastElementChild.style.fontSize = dataStuff.legalFS+"px";
	
	document.getElementById('disclaimer').lastElementChild.innerHTML = dataStuff.disclaimer;
	document.getElementById('disclaimer').lastElementChild.style.fontSize = dataStuff.disclaimerFS+"px";

	function bgExitHandler(e) {
		Enabler.exitOverride('Background Exit', dynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CLICKTHROUGH.Url);
	}
	document.getElementById('bg-exit').addEventListener('click', bgExitHandler, false);
	document.getElementById('bg-exit').addEventListener('touchstart', bgExitHandler, false);

	
	function ctaExitHandler(e) {
		Enabler.exitOverride('CTA Exit', dynamicContent.ITM_IMAGE_TEMPLATE_Sheet1[0].CTA_CLICKTHROUGH.Url);
	}
	document.getElementById('cta-btn').addEventListener('click', ctaExitHandler, false);
	document.getElementById('cta-btn').addEventListener('touchstart', ctaExitHandler, false);
	
	loopLimit = dataStuff.loop;
	
	showFrame1();
    updatePosition();
    
}

function showFrame1(){
	currentLoop ++;
	var hideFrame1 = function(){
        tween.to("line1", 0.2, {opacity:"0"});
    };
    tween.to("cta-btn", .5, {opacity:"1",delay:1});
 	tween.to("disclaimer", .2, {opacity:"1"});   
    tween.to("line1", .2, {opacity:"1",left:lineLeft});
	setTimeout(function(){
		hideFrame1();
        setTimeout(function(){showFrame2();}, 300);
	}, 3000);
}

function showFrame2(stopHere){
	var hideFrame2 = function(){
		tween.to("line2", 0.2, {opacity:"0"});
	};
    tween.to("cta-btn", .5, {opacity:"1",delay:1});
    tween.to("line2", .2, {opacity:"1",left:lineLeft});
	tween.to("disclaimer", 1, {opacity:"1", delay:2});
    
    var line3Text = document.getElementById('line3').lastElementChild.innerHTML;
    
	setTimeout(function(){
		if(stopHere){
			stopFrameAnimation = true;
		}else{
			var line3Text = document.getElementById('line3').lastElementChild.innerHTML;
			if(line3Text == "" || line3Text == undefined){
				var legalElementText = document.getElementById('legal').lastElementChild.innerHTML;
				if(legalElementText == "" || legalElementText == undefined){ //No Final Legal frame
					if(loopLimit == 0 || currentLoop < loopLimit){
						hideFrame2();
						setTimeout(function(){ 
						   resetFrame();
                           setTimeout(function(){ 
                           		showFrame1(); 
                           	},100);
                        }, 1000);
					}else{
						stopFrameAnimation = true;
					}
				}else{
					hideFrame2();
                    tween.to("cta-btn", .5, {opacity:"0"});
                    tween.to("disclaimer", .5, {opacity:"0"});
					setTimeout(function(){ showLegal(); }, 300);
				}
			}else{
				hideFrame2();
				setTimeout(function(){ showFrame3(); }, 300);
			}
		}
	}, 3000);
}

function showFrame3(stopHere){
	var hideFrame3 = function(){
		tween.to("line3", 0.2, {opacity:"0"});
	};
    tween.to("cta-btn", .5, {opacity:"1",delay:1});
    tween.to("line3", .2, {opacity:"1",left:lineLeft});
    tween.to("disclaimer", 1, {opacity:"1", delay:2});
    
	setTimeout(function(){
		var legalElementText = document.getElementById('legal').lastElementChild.innerHTML;
		if(stopHere){
			stopFrameAnimation = true;
		}else{
			if(legalElementText == "" || legalElementText == undefined){ //No Final Legal frame
				if(loopLimit == 0 || currentLoop < loopLimit){
					hideFrame3();
					setTimeout(function(){ 
						resetFrame();
                       setTimeout(function(){ 
                       		showFrame1(); 
                       	},100);
                    }, 1000);
				}else{
					stopFrameAnimation = true;
				}
			}else{
				hideFrame3();
                tween.to("cta-btn", .5, {opacity:"0"});
                tween.to("disclaimer", .5, {opacity:"0"});
				setTimeout(function(){ showLegal(); }, 1000);
			}
		}
	}, 3000);	
}

function showLegal(){
    tween.to("asset", 1, {opacity:"0"});
	tween.to("legal", 1, {opacity:"1"});
	var hideLegal = function(){tween.to("legal", 1, {opacity:"0"});tween.to("asset", 1, {opacity:"1"});};
	if(loopLimit == 0 || currentLoop < loopLimit){
		setTimeout(function(){
			hideLegal();
			setTimeout(function(){
                resetFrame();
                setTimeout(function(){showFrame1();},100);
            }, 1000);
		}, legalDuration);
	}else{
		setTimeout(function(){
			hideLegal();
            setTimeout(function(){
                var line3Text = document.getElementById('line3').lastElementChild.innerHTML;
                if(line3Text == "" || line3Text == undefined) showFrame2(true); else showFrame3(true);
            }, 1000);
		}, legalDuration);
	}
}
function createBG(assetURL){
	document.getElementById('asset').style.backgroundImage = "url("+assetURL+")";
}
function updatePosition(){
	var line1 = document.getElementById('line1');
	var line2 = document.getElementById('line2');
	var line3 = document.getElementById('line3');
    var msg = document.getElementById('message');
	var cta_btn = document.getElementById('cta-btn');
	var disclaimer = document.getElementById('disclaimer');
	
	var mainWidth = document.getElementById("main").offsetWidth;
	var mainHeight = document.getElementById("main").offsetHeight;
	var line2Height = line2.offsetHeight;
	var line3Height = line3.offsetHeight;
	var ctaBtnHeight = cta_btn.offsetHeight;	
	var ctaBtnWidth = cta_btn.offsetWidth;
	var disclaimerHeight = disclaimer.offsetHeight;
	
	if(cta_btn.lastElementChild.innerHTML == "") {
		cta_btn.style.display = "none";
	}else{
		cta_btn.style.display = "inline";
	}
	var highestLine = 0;
	if(line2Height > line3Height) highestLine = line2Height; else highestLine = line3Height;
	
	var lineY = 20;

	var discY = (mainHeight - disclaimerHeight - 10);
	var ctaBtnY = (mainHeight - 50 - 10 - ctaBtnHeight - 10);
	cta_btn.style.top = ctaBtnY + "px";	
		
	//cta_btn.style.left = mainWidth/2 - ctaBtnWidth/2 + "px";
	disclaimer.style.top =  discY + "px";
}

function resetFrame(){
	tween.to("line1", 0, {opacity:"0",left:"30px"});
	tween.to("line2", 0, {opacity:"0",left:"30px"});
	tween.to("line3", 0, {opacity:"0",left:"30px"});
	tween.to("legal", 0, {opacity:"0"});
	tween.to("cta-btn", 0, {opacity:"0"});
}
function resetBanner(){
	if(stopFrameAnimation){		
		stopFrameAnimation = false;
		resetFrame();

		rollOverReplayTracking();	

		setTimeout(function(){

			showFrame1();
		}, 100);		
	}
}
function parseBannerCode(bannerCode){
	var dataObj={};
	var dataList = bannerCode.split("||");
	var param;
	for(var i=0; i < dataList.length; i++){
		param = String(dataList[i]).split("=");
		dataObj[param[0]] = unescape((String(param[1])));
	}
	return dataObj;
}

function setListeners(){
	// restart animation on rollover
	var bg_exit = document.getElementById('bg-exit');
	var cta_btn = document.getElementById('cta-btn');
	
	bg_exit.onmouseover = function(e){
		bannerRollover();
	};
	bg_exit.onmouseout = function(e){
		resetBanner(); 
		bannerRollout();
	};
	cta_btn.onmouseover = ctaRollover;
	cta_btn.onmouseout = ctaRollout;
}
function bannerRollover(){
	Enabler.counter("mainClickthrough OVER");
	Enabler.startTimer("mainClickthroughTimer");
}
function bannerRollout(){
	Enabler.counter("mainClickthrough OUT");
	Enabler.stopTimer("mainClickthroughTimer");
}
function ctaRollover(){
	Enabler.counter("cta OVER");
	Enabler.startTimer("mainClickthroughTimer");
}
function ctaRollout(){
	Enabler.counter("cta OUT");
	Enabler.stopTimer("mainClickthroughTimer");
}
function rollOverReplayTracking(){
	Enabler.counter("mainClickthrough OVER REPLAY");
}
//-------------------------------- TWEEN
function Tween(){
	this._duration = 0;
	this._delayTransition = 0;
	this._elementTag;
}

Tween.prototype = {
	to : function(elementTagID, duration, properties){
		this._elementTag = document.getElementById(elementTagID);
		this._duration = duration;
		this._delayTransition = 0;
		var transitionValue = "";
		var completeFunction = {};
		var easing = "";
		
		for (var prop in properties) {
			switch(prop){
				case "delay": this._delayTransition = properties[prop];break;
				case "onComplete": completeFunction = {finish:properties[prop]}; break;
				case "ease": easing = properties[prop]; break;
				default:
					this._elementTag.style[prop] = properties[prop];
					transitionValue += (prop + " "+this._duration+"s,");
			}
		}
		transitionValue = transitionValue.substring(0, transitionValue.length - 1);
		
		this._elementTag.style.transition = transitionValue;
		this._elementTag.style.WebkitTransition = transitionValue;
		this._elementTag.style.transitionDelay = this._delayTransition+"s";
		this._elementTag.style.WebkitTransitionDelay = this._delayTransition+"s";
		
		if(easing){
			this._elementTag.style.transitionTimingFunction = easing;
			this._elementTag.style.WebkitTransitionTimingFunction = easing;
		}
		
		if(completeFunction.finish){
			function tweenEnd(evt){
				var targetElement = evt.target;
				targetElement.removeEventListener("transitionend", tweenEnd, false);
				targetElement.removeEventListener("webkitTransitionEnd", tweenEnd, false);
				targetElement.removeEventListener("mozTransitionEnd", tweenEnd, false);
				targetElement.removeEventListener("msTransitionEnd", tweenEnd, false);
				targetElement.removeEventListener("oTransitionEnd", tweenEnd, false);
				completeFunction.finish();
			};			
			this._elementTag.addEventListener("transitionend", tweenEnd, false);
			this._elementTag.addEventListener("webkitTransitionEnd", tweenEnd, false);
			this._elementTag.addEventListener("mozTransitionEnd", tweenEnd, false);
			this._elementTag.addEventListener("msTransitionEnd", tweenEnd, false);
			this._elementTag.addEventListener("oTransitionEnd", tweenEnd, false);
		}
	}
}
var tween = new Tween();
//-----------------

pageLoadedHandler();