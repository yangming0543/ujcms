System.register(["./index-legacy-D9wwV_LM.js","./duration-legacy-CrhtyhLb.js","./stat-legacy-I4KfDRje.js","./content-legacy-CWzKS2vh.js","./interaction-legacy-Bjr280lp.js"],(function(t,e){"use strict";var a,l,s,n,u,i,r,d,o,c,v,p,f,y,x,m,g,b,w,h,_,C,k,$,j,Y,S,D,V,q,M,R,A,N,O,P;return{setters:[t=>{a=t.d,l=t.u,s=t.U,n=t.V,u=t.r,i=t.o,r=t.W,d=t.b,o=t.e,c=t.I,v=t.i,p=t.w,f=t.f,y=t.k,x=t.j,m=t.X,g=t.l,b=t.t,w=t.h,h=t.Y,_=t.Z,C=t.J,k=t.$,$=t.a0,j=t.a1,Y=t.a2,S=t.a3},t=>{D=t.d},t=>{V=t.q,q=t.a,M=t.b},t=>{R=t.q,A=t.a,N=t.b,O=t.c},t=>{P=t.q}],execute:function(){const e={class:"mb-3 shadow-md bg-warning-lighter"},z={class:"flex items-center justify-between px-4 py-3 text-xl text-warning"},T={class:"flex items-center"},B={class:"mb-3 shadow-md bg-warning-lighter"},H={class:"flex items-center justify-between px-4 py-3 text-xl text-warning"},L={class:"flex items-center"},I={class:"mb-3 shadow-md bg-warning-lighter"},F={class:"flex items-center justify-between px-4 py-3 text-xl text-warning"},W={class:"flex items-center"},E={class:"mb-3 shadow-md bg-warning-lighter"},G={class:"flex items-center justify-between px-4 py-3 text-xl text-warning"},J={class:"flex items-center"},U={class:"mb-3 shadow-md bg-warning-lighter"},X={class:"flex items-center justify-between px-4 py-3 text-xl text-warning"},Z={class:"flex items-center"},K={class:"p-3 app-block"},Q={class:"text-sm text-gray-secondary"},tt={class:"flex items-end justify-between mt-1"},et={class:"text-3xl text-primary"},at={class:"flex items-center justify-center w-12 h-12 text-xl text-white rounded bg-primary"},lt={class:"flex justify-between pt-2 mt-3 text-xs border-t text-gray-regular"},st={class:"p-3 app-block"},nt={class:"text-sm text-gray-secondary"},ut={class:"flex items-end justify-between mt-1"},it={class:"text-3xl text-primary"},rt={class:"flex items-center justify-center w-12 h-12 text-xl text-white rounded bg-warning"},dt={class:"flex justify-between pt-2 mt-3 text-xs border-t text-gray-regular"},ot={class:"p-3 app-block"},ct={class:"text-sm text-gray-secondary"},vt={class:"flex items-end justify-between mt-1"},pt={class:"text-3xl text-primary"},ft={class:"flex items-center justify-center w-12 h-12 text-xl text-white rounded bg-success"},yt={class:"flex justify-between pt-2 mt-3 text-xs border-t text-gray-regular"},xt={class:"p-3 app-block"},mt={class:"text-sm text-gray-secondary"},gt={class:"flex items-end justify-between mt-1"},bt={class:"text-3xl text-primary"},wt={class:"flex items-center justify-center w-12 h-12 text-xl text-white rounded bg-danger"},ht={class:"flex justify-between pt-2 mt-3 text-xs border-t text-gray-regular"},_t={class:"px-3 py-5 mt-3 app-block"},Ct={class:"flex p-3 mt-3 justify-evenly app-block"},kt={class:"h-64 w-60 text-primary"},$t={class:"mt-2 text-center"},jt={class:"flex items-center justify-center mt-2"},Yt={class:"text-3xl"},St={key:0},Dt={key:1},Vt={class:"mt-4 space-y-2 text-sm"},qt={key:0},Mt={key:1},Rt={key:0},At={key:1},Nt={key:0},Ot={key:1},Pt={class:"h-64 w-60 text-gray-secondary"},zt={class:"mt-2 text-center"},Tt={class:"flex items-center justify-center mt-2"},Bt={class:"text-3xl"},Ht={key:0},Lt={key:1},It={class:"mt-4 space-y-2 text-sm"},Ft={key:0},Wt={key:1},Et={key:0},Gt={key:1},Jt={key:0},Ut={key:1},Xt={class:"p-3 mt-3 app-block"};t("default",a({__name:"HomePage",setup(t){const{t:a,n:Zt}=l();s.extend(D);const Kt=n(),Qt=n(),te=u({}),ee=u({}),ae=u({}),le=u(0),se=u(0),ne=u(0),ue=u(0),ie=u(0);return i((async()=>{r("articleReview:list")&&((async()=>{S.epRank>=1&&(le.value=await R())})(),(async()=>{S.epRank>=1&&(se.value=await A())})()),r("formReview:list")&&((async()=>{S.epRank>=3&&(ue.value=await N())})(),(async()=>{S.epRank>=3&&(ie.value=await O())})()),r("messageBoard:list")&&(async()=>{ne.value=await P()})(),(async()=>{const t=await V({begin:s().startOf("day").subtract(1,"day").format(),end:s().endOf("day").format()}),e={tooltip:{trigger:"axis"},legend:{data:[a("visitTrend.yesterdayPv"),a("visitTrend.todayPv")]},grid:{left:16,right:16,top:40,bottom:0,containLabel:!0},xAxis:{type:"category",boundaryGap:!1,axisTick:{show:!1},data:Array.from(Array(24).keys())},yAxis:{type:"value",minInterval:1},series:[{name:a("visitTrend.yesterdayPv"),type:"line",symbol:"circle",color:"#a0cfff",data:t.filter((t=>s(t.date)<s().startOf("day"))).map((t=>Number(t.pvCount)))},{name:a("visitTrend.todayPv"),type:"line",symbol:"circle",color:"#409eff",areaStyle:{color:"#ecf5ff"},data:t.filter((t=>s(t.date)>=s().startOf("day"))).map((t=>Number(t.pvCount)))}]},l=Kt.value;if(null==l)return;let n=j.getInstanceByDom(l);null==n&&(n=j.init(l)),n.setOption(e),window.addEventListener("resize",(function(){n&&n.resize()}))})(),(async()=>{const t=await q({begin:s().subtract(30,"day").format("YYYY-MM-DD"),end:s().format("YYYY-MM-DD")}),e={title:{text:a("menu.stat.visitSource"),textStyle:{color:"#909399",fontWeight:"normal",fontSize:16}},legend:{type:"scroll",orient:"vertical",right:"10%",top:16,bottom:16},tooltip:{trigger:"item",valueFormatter:t=>Zt(t)},series:[{name:a("menu.stat.visitSource"),type:"pie",radius:["44%","80%"],center:["40%","54%"],avoidLabelOverlap:!1,itemStyle:{borderRadius:4,borderColor:"#fff",borderWidth:2},label:{show:!1},emphasis:{label:{show:!1}},labelLine:{show:!1},data:t.map((t=>({value:Number(t.pvCount),name:a(`visitSource.type.${t.name}`)})))}]},l=Qt.value;if(null==l)return;let n=j.getInstanceByDom(l);null==n&&(n=j.init(l)),n.setOption(e),window.addEventListener("resize",(function(){n&&n.resize()}))})(),(async()=>{const t=await M({begin:s().subtract(30,"day").format("YYYY-MM-DD"),end:s().format("YYYY-MM-DD")});te.value=t.newVisitor,ee.value=t.oldVisitor,te.value.pvCount=Number(te.value.pvCount),ee.value.pvCount=Number(ee.value.pvCount),te.value.uvCount=Number(te.value.uvCount),ee.value.uvCount=Number(ee.value.uvCount);const e=te.value.uvCount+ee.value.uvCount;e>0?(te.value.proportion=100*te.value.uvCount/e,ee.value.proportion=100*ee.value.uvCount/e):(te.value.proportion=50,ee.value.proportion=50)})(),(async()=>{ae.value=await Y()})()})),(t,a)=>{const l=d("el-icon"),n=d("el-link"),u=d("el-col"),i=d("el-row");return o(),c("div",null,[v(i,{gutter:12},{default:p((()=>[le.value>0?(o(),f(u,{key:0,span:6},{default:p((()=>[y("div",e,[y("div",z,[y("div",T,[v(l,null,{default:p((()=>[v(x(m))])),_:1}),v(n,{class:"ml-1 text-base",type:"warning",underline:!1,onClick:a[0]||(a[0]=()=>t.$router.push({path:"/content/article-review"}))},{default:p((()=>[g(b(t.$t("todo.pendingArticle")),1)])),_:1})]),y("div",null,[v(n,{class:"ml-1 text-xl",type:"warning",underline:!1,onClick:a[1]||(a[1]=()=>t.$router.push({path:"/content/article-review"}))},{default:p((()=>[g(b(le.value),1)])),_:1})])])])])),_:1})):w("",!0),se.value>0?(o(),f(u,{key:1,span:6},{default:p((()=>[y("div",B,[y("div",H,[y("div",L,[v(l,null,{default:p((()=>[v(x(m))])),_:1}),v(n,{class:"ml-1 text-base",type:"warning",underline:!1,onClick:a[2]||(a[2]=()=>t.$router.push({path:"/content/article",query:{status:22}}))},{default:p((()=>[g(b(t.$t("todo.rejectedArticle")),1)])),_:1})]),y("div",null,[v(n,{class:"ml-1 text-xl",type:"warning",underline:!1,onClick:a[3]||(a[3]=()=>t.$router.push({path:"/content/article",query:{status:22}}))},{default:p((()=>[g(b(se.value),1)])),_:1})])])])])),_:1})):w("",!0),ue.value>0?(o(),f(u,{key:2,span:6},{default:p((()=>[y("div",I,[y("div",F,[y("div",W,[v(l,null,{default:p((()=>[v(x(m))])),_:1}),v(n,{class:"ml-1 text-base",type:"warning",underline:!1,onClick:a[4]||(a[4]=()=>t.$router.push({path:"/content/form-review"}))},{default:p((()=>[g(b(t.$t("todo.pendingForm")),1)])),_:1})]),y("div",null,[v(n,{class:"ml-1 text-xl",type:"warning",underline:!1,onClick:a[5]||(a[5]=()=>t.$router.push({path:"/content/form-review"}))},{default:p((()=>[g(b(ue.value),1)])),_:1})])])])])),_:1})):w("",!0),ie.value>0?(o(),f(u,{key:3,span:6},{default:p((()=>[y("div",E,[y("div",G,[y("div",J,[v(l,null,{default:p((()=>[v(x(m))])),_:1}),v(n,{class:"ml-1 text-base",type:"warning",underline:!1,onClick:a[6]||(a[6]=()=>t.$router.push({path:"/content/form",query:{status:22}}))},{default:p((()=>[g(b(t.$t("todo.rejectedForm")),1)])),_:1})]),y("div",null,[v(n,{class:"ml-1 text-xl",type:"warning",underline:!1,onClick:a[7]||(a[7]=()=>t.$router.push({path:"/content/form",query:{status:22}}))},{default:p((()=>[g(b(ie.value),1)])),_:1})])])])])),_:1})):w("",!0),ne.value>0?(o(),f(u,{key:4,span:6},{default:p((()=>[y("div",U,[y("div",X,[y("div",Z,[v(l,null,{default:p((()=>[v(x(m))])),_:1}),v(n,{class:"ml-1 text-base",type:"warning",underline:!1,onClick:a[8]||(a[8]=()=>t.$router.push({path:"/interaction/message-board",query:{status:1}}))},{default:p((()=>[g(b(t.$t("todo.unreviewedMessageBoard")),1)])),_:1})]),y("div",null,[v(n,{class:"ml-1 text-xl",type:"warning",underline:!1,onClick:a[9]||(a[9]=()=>t.$router.push({path:"/interaction/message-board",query:{status:1}}))},{default:p((()=>[g(b(ne.value),1)])),_:1})])])])])),_:1})):w("",!0)])),_:1}),v(i,{gutter:12},{default:p((()=>[v(u,{span:6},{default:p((()=>[y("div",K,[y("div",Q,b(t.$t("contentStat.article")),1),y("div",tt,[y("div",et,b(ae.value.article?.total),1),y("div",at,[v(l,null,{default:p((()=>[v(x(h))])),_:1})])]),y("div",lt,[y("div",null,b(t.$t("contentStat.last7day")),1),y("div",null,b(ae.value.article?.last7day),1)])])])),_:1}),v(u,{span:6},{default:p((()=>[y("div",st,[y("div",nt,b(t.$t("contentStat.channel")),1),y("div",ut,[y("div",it,b(ae.value.channel?.total),1),y("div",rt,[v(l,null,{default:p((()=>[v(x(_))])),_:1})])]),y("div",dt,[y("div",null,b(t.$t("contentStat.last7day")),1),y("div",null,b(ae.value.channel?.last7day),1)])])])),_:1}),v(u,{span:6},{default:p((()=>[y("div",ot,[y("div",ct,b(t.$t("contentStat.user")),1),y("div",vt,[y("div",pt,b(ae.value.user?.total),1),y("div",ft,[v(l,null,{default:p((()=>[v(x(C))])),_:1})])]),y("div",yt,[y("div",null,b(t.$t("contentStat.last7day")),1),y("div",null,b(ae.value.user?.last7day),1)])])])),_:1}),v(u,{span:6},{default:p((()=>[y("div",xt,[y("div",mt,b(t.$t("contentStat.attachment")),1),y("div",gt,[y("div",bt,b(ae.value.attachment?.total),1),y("div",wt,[v(l,null,{default:p((()=>[v(x(k))])),_:1})])]),y("div",ht,[y("div",null,b(t.$t("contentStat.last7day")),1),y("div",null,b(ae.value.attachment?.last7day),1)])])])),_:1})])),_:1}),y("div",_t,[y("div",{ref_key:"trendChart",ref:Kt,class:"h-64"},null,512)]),v(i,{gutter:12},{default:p((()=>[v(u,{span:12},{default:p((()=>[y("div",Ct,[y("div",kt,[y("div",$t,b(t.$t("visitVisitor.newVisitor")),1),y("div",jt,[v(l,{class:"text-5xl"},{default:p((()=>[v(x($))])),_:1}),y("span",Yt,[te.value.uvCount>0?(o(),c("span",St,b(t.$n(te.value.proportion??0,"decimal")),1)):(o(),c("span",Dt,"-")),g("% ")])]),y("div",Vt,[v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visitVisitor.pv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[g(b(te.value.pvCount),1)])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visitVisitor.uv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[g(b(te.value.uvCount),1)])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.bounceRate")),1)])),_:1}),v(u,{span:12},{default:p((()=>[te.value.uvCount>0?(o(),c("span",qt,b(t.$n(100*te.value.bounceCount/te.value.uvCount,"decimal"))+"%",1)):(o(),c("span",Mt,"-"))])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.averageDuration")),1)])),_:1}),v(u,{span:12},{default:p((()=>[te.value.uvCount>0?(o(),c("span",Rt,b(x(s).duration(te.value.duration/te.value.uvCount,"seconds").format("HH:mm:ss")),1)):(o(),c("span",At,"-"))])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.averagePv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[te.value.uvCount>0?(o(),c("span",Nt,b(t.$n(te.value.pvCount/te.value.uvCount,"decimal")),1)):(o(),c("span",Ot,"-"))])),_:1})])),_:1})])]),y("div",Pt,[y("div",zt,b(t.$t("visitVisitor.oldVisitor")),1),y("div",Tt,[v(l,{class:"text-5xl"},{default:p((()=>[v(x($))])),_:1}),y("span",Bt,[ee.value.uvCount>0?(o(),c("span",Ht,b(t.$n(ee.value.proportion??0,"decimal")),1)):(o(),c("span",Lt,"-")),g("% ")])]),y("div",It,[v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visitVisitor.pv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[g(b(ee.value.pvCount),1)])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visitVisitor.uv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[g(b(ee.value.uvCount),1)])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.bounceRate")),1)])),_:1}),v(u,{span:12},{default:p((()=>[ee.value.uvCount>0?(o(),c("span",Ft,b(t.$n(100*ee.value.bounceCount/ee.value.uvCount,"decimal"))+"%",1)):(o(),c("span",Wt,"-"))])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.averageDuration")),1)])),_:1}),v(u,{span:12},{default:p((()=>[ee.value.uvCount>0?(o(),c("span",Et,b(x(s).duration(ee.value.duration/ee.value.uvCount,"seconds").format("HH:mm:ss")),1)):(o(),c("span",Gt,"-"))])),_:1})])),_:1}),v(i,{gutter:24},{default:p((()=>[v(u,{span:12,class:"text-right"},{default:p((()=>[g(b(t.$t("visit.averagePv")),1)])),_:1}),v(u,{span:12},{default:p((()=>[ee.value.uvCount>0?(o(),c("span",Jt,b(t.$n(ee.value.pvCount/ee.value.uvCount,"decimal")),1)):(o(),c("span",Ut,"-"))])),_:1})])),_:1})])])])])),_:1}),v(u,{span:12},{default:p((()=>[y("div",Xt,[y("div",{ref_key:"sourceTypeChart",ref:Qt,class:"w-full h-64"},null,512)])])),_:1})])),_:1})])}}}))}}}));
