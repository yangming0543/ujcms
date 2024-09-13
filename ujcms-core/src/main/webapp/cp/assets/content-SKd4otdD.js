import{b0 as t}from"./index-CfDPjNFe.js";const s="../api/backend/core/jod-convert/doc",o="../api/backend/core/jod-convert/library",r=async()=>(await t.get("/backend/core/jod-convert/enabled")).data,d=async a=>(await t.get("/backend/core/channel",{params:a})).data,i=async a=>(await t.get("/backend/core/channel/".concat(a))).data,l=async a=>(await t.post("/backend/core/channel",a)).data,y=async a=>(await t.post("/backend/core/channel?_method=put",a)).data,p=async(a,e,c)=>(await t.post("/backend/core/channel/move?_method=put",{fromId:a,toId:e,type:c})).data,b=async()=>(await t.post("/backend/core/channel/tidy-tree?_method=put")).data,k=async a=>(await t.post("/backend/core/channel?_method=delete",a)).data,w=async()=>(await t.get("/backend/core/channel/channel-permissions")).data,u=async()=>(await t.get("/backend/core/channel/channel-templates")).data,m=async()=>(await t.get("/backend/core/channel/article-templates")).data,h=async a=>(await t.get("/backend/core/channel/alias-exist",{params:{alias:a}})).data,g=async a=>(await t.get("/backend/core/article",{params:a})).data,A=async a=>(await t.get("/backend/core/article/reject-count",{params:a})).data,_=async a=>(await t.get("/backend/core/article/".concat(a))).data,q=async(a,e,c)=>(await t.get("/backend/core/article/title-similarity",{params:{similarity:a,title:e,excludeId:c}})).data,v=async a=>(await t.post("/backend/core/article",a)).data,C=async a=>(await t.post("/backend/core/article?_method=put",a)).data,x=async(a,e)=>(await t.post("/backend/core/article/update-order",{fromId:a,toId:e})).data,f=async a=>(await t.post("/backend/core/article/internal-push",a)).data,j=async a=>(await t.post("/backend/core/article/external-push",a)).data,T=async(a,e,c)=>(await t.post("/backend/core/article/sticky?_method=put",{ids:a,sticky:e,stickyDate:c})).data,D=async a=>(await t.post("/backend/core/article/delete?_method=put",a)).data,$=async a=>(await t.post("/backend/core/article/submit?_method=put",a)).data,B=async a=>(await t.post("/backend/core/article/archive?_method=put",a)).data,P=async a=>(await t.post("/backend/core/article/offline?_method=put",a)).data,I=async a=>(await t.post("/backend/core/article?_method=delete",a)).data,L=async a=>(await t.get("/backend/core/article-review/pending-count",{params:a})).data,R=async a=>(await t.get("/backend/core/article-review/".concat(a))).data,O=async(a,e,c)=>(await t.post("/backend/core/article-review/pass/".concat(a,"?_method=put"),{properties:e,comment:c})).data,E=async(a,e,c)=>(await t.post("/backend/core/article-review/delegate?_method=put",{taskId:a,toUserId:e,comment:c})).data,F=async(a,e,c)=>(await t.post("/backend/core/article-review/transfer?_method=put",{taskId:a,toUserId:e,comment:c})).data,S=async(a,e,c)=>(await t.post("/backend/core/article-review/back?_method=put",{taskId:a,activityId:e,comment:c})).data,U=async(a,e)=>(await t.post("/backend/core/article-review/reject?_method=put",{taskIds:a,reason:e})).data,H=async a=>(await t.get("/backend/core/block-item",{params:a})).data,J=async a=>(await t.get("/backend/core/block-item/".concat(a))).data,z=async a=>(await t.post("/backend/core/block-item",a)).data,G=async a=>(await t.post("/backend/core/block-item?_method=put",a)).data,K=async(a,e)=>(await t.post("/backend/core/block-item/update-order",{fromId:a,toId:e})).data,M=async a=>(await t.post("/backend/core/block-item?_method=delete",a)).data,N=async a=>(await t.get("/backend/core/dict",{params:a})).data,Q=async(a,e)=>(await t.get("/backend/core/dict/list-by-alias",{params:{alias:a,name:e}})).data,V=async a=>(await t.get("/backend/core/dict/".concat(a))).data,W=async a=>(await t.post("/backend/core/dict",a)).data,X=async a=>(await t.post("/backend/core/dict?_method=put",a)).data,Y=async a=>(await t.post("/backend/core/dict/order?_method=put",a)).data,Z=async a=>(await t.post("/backend/core/dict?_method=delete",a)).data,aa=async()=>(await t.post("/backend/core/generator/fulltext-reindex-all")).data,ta=async()=>(await t.post("/backend/core/generator/fulltext-reindex-site")).data,ea=async()=>(await t.post("/backend/core/generator/html-all")).data,ca=async()=>(await t.post("/backend/core/generator/html-home")).data,na=async()=>(await t.post("/backend/core/generator/html-channel")).data,sa=async()=>(await t.post("/backend/core/generator/html-article")).data,oa=async a=>(await t.get("/backend/core/tag",{params:a})).data,ra=async a=>(await t.get("/backend/core/tag/list",{params:a})).data,da=async a=>(await t.get("/backend/core/tag/".concat(a))).data,ia=async a=>(await t.post("/backend/core/tag",a)).data,la=async a=>(await t.post("/backend/core/tag?_method=put",a)).data,ya=async a=>(await t.post("/backend/core/tag?_method=delete",a)).data,pa=async a=>(await t.get("/backend/ext/form/reject-count",{params:a})).data,ba=async a=>(await t.get("/backend/ext/form-review/pending-count",{params:a})).data;export{ia as $,f as A,j as B,N as C,g as D,x as E,T as F,M as G,h as H,i as I,l as J,y as K,k as L,u as M,w as N,p as O,b as P,H as Q,K as R,G as S,J as T,z as U,V,W,X,Z as Y,Y as Z,da as _,A as a,la as a0,ya as a1,oa as a2,aa as a3,ta as a4,ea as a5,ca as a6,na as a7,sa as a8,ba as b,pa as c,s as d,R as e,_ as f,v as g,I as h,ra as i,o as j,r as k,Q as l,d as m,m as n,E as o,O as p,L as q,S as r,U as s,F as t,C as u,D as v,$ as w,B as x,P as y,q as z};
