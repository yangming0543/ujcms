import{d as ye,p as ge,u as he,r as $,ac as B,aX as ee,o as Ve,v as G,b as w,c as $e,e as m,f as F,w as d,l as y,t as r,j as S,I as N,h as I,g as ae,as as L,ak as we,bc as z,i as k,ae as Se,E as R,ah as ke,m as Ce}from"./index-CfDPjNFe.js";const Be={key:0},Ee={key:0},Ie={key:1},qe={class:"space-x-2"},De={key:0},le="ujcms_continuous_settings",je=ye({__name:"DialogForm",props:{modelValue:{type:Boolean,required:!0},values:{type:Object,required:!0},name:{type:String,required:!0},beanId:{type:[Number,String],default:null},beanIds:{type:Array,required:!0},initValues:{type:Function,required:!0},toValues:{type:Function,required:!0},queryBean:{type:Function,required:!0},createBean:{type:Function,required:!0},updateBean:{type:Function,required:!0},deleteBean:{type:Function,required:!0},disableDelete:{type:Function,default:null},disableEdit:{type:Function,default:null},beforeValidate:{type:Function,default:null},preventSubmit:{type:Function,default:null},addable:{type:Boolean,default:!0},action:{type:String,default:"edit"},showId:{type:Boolean,default:!0},perms:{type:String,default:null},focus:{type:Object,default:null},large:{type:Boolean,default:!1},labelPosition:{type:String,default:"right"},labelWidth:{type:String,default:"150px"}},emits:{"update:modelValue":null,"update:values":null,finished:null,beanChange:null,beforeSubmit:null},setup(n,{expose:te,emit:ue}){function X(){const e=localStorage.getItem(le);return e?JSON.parse(e):{}}function ne(e){localStorage.setItem(le,JSON.stringify(e))}function se(e){var u;return(u=X()[e])!=null?u:!1}function ie(e,l){const u=X();u[e]=l,ne(u)}const a=n,t=ue,{name:O,beanId:H,beanIds:oe,focus:q,values:s,action:de,modelValue:K}=ge(a),{t:D}=he(),j=$(!1),c=$(!1),f=$(se(O.value)),g=$(),v=$(a.initValues()),P=$(),i=$(),b=$([]),o=B(()=>i.value!=null&&de.value==="edit"),A=B(()=>!j.value&&!ee.isEqual(P.value,s.value)),h=B(()=>{var e,l;return(l=(e=a.disableEdit)==null?void 0:e.call(a,v.value))!=null?l:!1}),ve=B(()=>"".concat(O.value," - ").concat(o.value?"".concat(D(h.value?"detail":"edit")," (ID: ").concat(i.value,")"):"".concat(D("add")))),T=async()=>{var e;j.value=!0;try{v.value=i.value!=null?await a.queryBean(i.value):a.initValues(s.value),P.value=i.value!=null?a.toValues(v.value):v.value,t("update:values",ee.cloneDeep(P.value)),t("beanChange",v.value),(e=g.value)==null||e.resetFields()}finally{j.value=!1}};Ve(()=>t("update:values",a.initValues())),G(K,()=>{K.value&&(b.value=oe.value,i.value!==H.value?i.value=H.value:T())}),G(i,()=>{T()}),G(f,()=>ie(O.value,f.value));const V=B(()=>b.value.indexOf(i.value)),U=B(()=>V.value>0),M=B(()=>V.value<b.value.length-1),J=()=>{U.value&&(i.value=b.value[V.value-1])},W=()=>{M.value&&(i.value=b.value[V.value+1])},re=()=>{var e,l;(l=(e=q.value)==null?void 0:e.focus)==null||l.call(e),i.value=void 0},ce=()=>{t("update:modelValue",!1)},Q=async()=>{c.value=!0;try{await a.deleteBean([i.value]),f.value||t("update:modelValue",!1),M.value?(W(),b.value.splice(V.value-1,1)):U.value?(J(),b.value.splice(V.value+1,1)):t("update:modelValue",!1),R.success(D("success")),t("finished")}finally{c.value=!1}},Y=()=>{P.value=a.toValues(s.value)},Z=async()=>{var e;await((e=a.beforeValidate)==null?void 0:e.call(a,s.value)),g.value.validate(async l=>{var u,C,E,_;if(l){c.value=!0;try{if((C=await((u=a.preventSubmit)==null?void 0:u.call(a,s.value)))!=null&&C)return;t("beforeSubmit",s.value),o.value?(await a.updateBean(s.value),Y()):(await a.createBean(s.value),(_=(E=q.value)==null?void 0:E.focus)==null||_.call(E),t("update:values",a.initValues(s.value)),g.value.resetFields()),R.success(D("success")),f.value||t("update:modelValue",!1),t("finished",v.value)}finally{c.value=!1}}})};return te({form:g,submit:e=>{g.value.validate(async l=>{var u,C;if(l){c.value=!0;try{if((C=await((u=a.preventSubmit)==null?void 0:u.call(a,s.value)))!=null&&C)return;t("beforeSubmit",s.value),await e(s.value,{isEdit:o.value,continuous:f.value,form:g.value,props:a,focus:q.value,loadBean:T,resetOrigValues:Y,emit:t}),f.value||t("update:modelValue",!1),t("finished",v.value)}finally{c.value=!1}}})},remove:async e=>{c.value=!0;try{await e(s.value,{isEdit:o.value,continuous:f.value,form:g.value,props:a,focus:q.value,loadBean:T,emit:t}),f.value||t("update:modelValue",!1),M.value?(W(),b.value.splice(V.value-1,1)):U.value?(J(),b.value.splice(V.value+1,1)):t("update:modelValue",!1),R.success(D("success")),t("finished")}finally{c.value=!1}}}),(e,l)=>{const u=w("el-button"),C=w("el-popconfirm"),E=w("el-button-group"),_=w("el-switch"),fe=w("el-tooltip"),me=w("el-tag"),be=w("el-form"),pe=w("el-dialog"),x=$e("loading");return m(),F(pe,{title:ve.value,"close-on-click-modal":!A.value,"model-value":n.modelValue,width:n.large?"98%":"768px",top:n.large?"16px":"8vh","onUpdate:modelValue":l[3]||(l[3]=p=>e.$emit("update:modelValue",p)),onOpened:l[4]||(l[4]=()=>{var p;return!o.value&&((p=S(q))==null?void 0:p.focus())})},{header:d(()=>[y(r(S(O))+" - ",1),o.value?(m(),N("span",Be,[y(r(e.$t(h.value?"detail":"edit"))+" ",1),n.showId?(m(),N("span",Ee,"(ID: "+r(i.value)+")",1)):I("",!0)])):(m(),N("span",Ie,r(e.$t("add")),1))]),default:d(()=>[ae((m(),N("div",qe,[o.value&&n.addable?(m(),F(u,{key:0,disabled:S(L)("".concat(n.perms,":create")),type:"primary",icon:S(we),onClick:re},{default:d(()=>[y(r(e.$t("add")),1)]),_:1},8,["disabled","icon"])):I("",!0),z(e.$slots,"header-action",{bean:v.value,isEdit:o.value,disabled:h.value,unsaved:A.value,disableDelete:n.disableDelete,handleDelete:Q},()=>[o.value?(m(),F(C,{key:0,title:e.$t("confirmDelete"),onConfirm:l[0]||(l[0]=()=>Q())},{reference:d(()=>{var p;return[k(u,{disabled:((p=n.disableDelete)==null?void 0:p.call(n,v.value))||S(L)("".concat(n.perms,":delete")),icon:S(ke)},{default:d(()=>[y(r(e.$t("delete")),1)]),_:1},8,["disabled","icon"])]}),_:1},8,["title"])):I("",!0)]),o.value?(m(),F(E,{key:1},{default:d(()=>[k(u,{disabled:!U.value,onClick:J},{default:d(()=>[y(r(e.$t("form.prev")),1)]),_:1},8,["disabled"]),k(u,{disabled:!M.value,onClick:W},{default:d(()=>[y(r(e.$t("form.next")),1)]),_:1},8,["disabled"])]),_:1})):I("",!0),k(u,{type:"primary",onClick:ce},{default:d(()=>[y(r(e.$t("back")),1)]),_:1}),k(fe,{content:e.$t("form.continuous"),placement:"top"},{default:d(()=>[k(_,{modelValue:f.value,"onUpdate:modelValue":l[1]||(l[1]=p=>f.value=p),size:"small"},null,8,["modelValue"])]),_:1},8,["content"]),A.value?(m(),F(me,{key:2,type:"danger"},{default:d(()=>[y(r(e.$t("form.unsaved")),1)]),_:1})):I("",!0),z(e.$slots,"header-status",{bean:v.value,isEdit:o.value,disabled:h.value})])),[[x,j.value||c.value]]),k(be,{ref_key:"form",ref:g,class:Se(["mt-5","pr-5"]),model:S(s),disabled:h.value,"label-width":n.labelWidth,"label-position":n.labelPosition,"scroll-to-error":""},{default:d(()=>[z(e.$slots,"default",{bean:v.value,isEdit:o.value,disabled:h.value}),h.value?I("",!0):ae((m(),N("div",De,[z(e.$slots,"footer-action",{bean:v.value,isEdit:o.value,disabled:h.value,handleSubmit:Z},()=>[k(u,{disabled:S(L)(o.value?"".concat(n.perms,":update"):"".concat(n.perms,":create")),type:"primary","native-type":"submit",onClick:l[2]||(l[2]=Ce(()=>Z(),["prevent"]))},{default:d(()=>[y(r(e.$t("save")),1)]),_:1},8,["disabled"])])])),[[x,c.value]])]),_:3},8,["model","disabled","label-width","label-position"])]),_:3},8,["title","close-on-click-modal","model-value","width","top"])}}});export{je as _};
