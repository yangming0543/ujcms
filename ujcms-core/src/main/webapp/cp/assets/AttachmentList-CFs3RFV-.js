import{d as R,u as T,r as n,o as U,b as u,c as Q,e as v,I as $,k as S,i as a,w as o,j as r,as as I,ah as q,l as p,t as m,g as F,f as J,U as K,a9 as O,aa as G,aH as W,aI as X,aJ as Z,aK as x,E as ee}from"./index-CfDPjNFe.js";import{g as te,h as ae}from"./system-dDBNDH9Z.js";import{a as le,_ as oe,b as se,c as ne}from"./QueryItem.vue_vue_type_script_setup_true_lang-BiDqtMxm.js";const re={class:"mb-3"},ie={class:"mt-3 app-block"},pe=R({name:"AttachmentList",__name:"AttachmentList",setup(ue){const{t:B}=T(),h=n({}),f=n(),g=n(1),y=n(10),z=n(0),C=n(),D=n([]),_=n([]),w=n(!1),E=n(!1),L=n(),i=async()=>{w.value=!0;try{const{content:e,totalElements:l}=await te({...Z(h.value),Q_OrderBy:f.value,page:g.value,pageSize:y.value});D.value=e,z.value=Number(l)}finally{w.value=!1}};U(i);const P=({column:e,prop:l,order:d})=>{var c;l&&d?f.value=((c=e.sortBy)!=null?c:l)+(d==="descending"?"_desc":""):f.value=void 0,i()},A=()=>i(),M=()=>{C.value.clearSort(),x(h.value),f.value=void 0,i()},N=e=>{L.value=e,E.value=!0},k=async e=>{await ae(e),i(),ee.success(B("success"))};return(e,l)=>{const d=u("el-button"),c=u("el-popconfirm"),s=u("el-table-column"),V=u("el-tag"),Y=u("el-table"),j=u("el-pagination"),H=Q("loading");return v(),$("div",null,[S("div",re,[a(r(oe),{params:h.value,onSearch:A,onReset:M},{default:o(()=>[a(r(le),{label:e.$t("attachment.name"),name:"Q_Contains_name"},null,8,["label"])]),_:1},8,["params"])]),S("div",null,[a(c,{title:e.$t("confirmDelete"),onConfirm:l[0]||(l[0]=()=>k(_.value.map(t=>t.id)))},{reference:o(()=>[a(d,{disabled:_.value.length<=0||r(I)("attachment:delete"),icon:r(q)},{default:o(()=>[p(m(e.$t("delete")),1)]),_:1},8,["disabled","icon"])]),_:1},8,["title"]),a(r(se),{name:"attachment",class:"ml-2"})]),S("div",ie,[F((v(),J(Y,{ref_key:"table",ref:C,data:D.value,onSelectionChange:l[1]||(l[1]=t=>_.value=t),onRowDblclick:l[2]||(l[2]=t=>N(t.id)),onSortChange:P},{default:o(()=>[a(r(ne),{name:"attachment"},{default:o(()=>[a(s,{type:"selection",selectable:t=>!t.used,width:"45"},null,8,["selectable"]),a(s,{property:"id",label:"ID",width:"170",sortable:"custom"}),a(s,{property:"name",label:e.$t("attachment.name"),sortable:"custom","min-width":"130","show-overflow-tooltip":""},null,8,["label"]),a(s,{property:"path",label:e.$t("attachment.path"),sortable:"custom","min-width":"200",display:"none","show-overflow-tooltip":""},null,8,["label"]),a(s,{property:"url",label:e.$t("attachment.url"),sortable:"custom","min-width":"350",display:"none","show-overflow-tooltip":""},null,8,["label"]),a(s,{property:"length",label:e.$t("attachment.length"),sortable:"custom",align:"right","show-overflow-tooltip":""},{default:o(({row:t})=>[p(m(t.size),1)]),_:1},8,["label"]),a(s,{property:"created",label:e.$t("attachment.created"),sortable:"custom","min-width":"120","show-overflow-tooltip":""},{default:o(({row:t})=>[p(m(r(K)(t.created).format("YYYY-MM-DD HH:mm")),1)]),_:1},8,["label"]),a(s,{property:"user.username",label:e.$t("attachment.user"),"sort-by":"user-username",sortable:"custom","show-overflow-tooltip":""},null,8,["label"]),a(s,{label:e.$t("attachment.refer"),"show-overflow-tooltip":""},{default:o(({row:t})=>[(v(!0),$(O,null,G(t.referList,b=>(v(),$("div",{key:"".concat(b.referType,"-").concat(b.referId)},m("".concat(b.referType,"-").concat(b.referId)),1))),128))]),_:1},8,["label"]),a(s,{property:"used",label:e.$t("attachment.used"),sortable:"custom","show-overflow-tooltip":""},{default:o(({row:t})=>[a(V,{type:t.used?"success":"info",size:"small"},{default:o(()=>[p(m(e.$t(t.used?"yes":"no")),1)]),_:2},1032,["type"])]),_:1},8,["label"]),a(s,{label:e.$t("table.action")},{default:o(({row:t})=>[a(c,{title:e.$t("confirmDelete"),onConfirm:()=>k([t.id])},{reference:o(()=>[a(d,{type:"primary",disabled:t.used||r(I)("attachment:delete"),size:"small",link:""},{default:o(()=>[p(m(e.$t("delete")),1)]),_:2},1032,["disabled"])]),_:2},1032,["title","onConfirm"])]),_:1},8,["label"])]),_:1})]),_:1},8,["data"])),[[H,w.value]]),a(j,{"current-page":g.value,"onUpdate:currentPage":l[3]||(l[3]=t=>g.value=t),pageSize:y.value,"onUpdate:pageSize":l[4]||(l[4]=t=>y.value=t),total:z.value,"page-sizes":r(W),layout:r(X),small:"",background:"",class:"justify-end px-3 py-2",onSizeChange:l[5]||(l[5]=()=>i()),onCurrentChange:l[6]||(l[6]=()=>i())},null,8,["current-page","pageSize","total","page-sizes","layout"])])])}}});export{pe as default};
