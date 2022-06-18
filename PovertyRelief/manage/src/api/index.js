import {get,post} from "./http";

// 判断管理员是否登录成功
export const getLoginStatus = (params) => post(`admin/login`,params);


//查询
export const getAllPeople =() => get(`people/allPeople`);
//添加
export const setPeople = (params) => post(`people/add`,params);
//编辑
export const updatePeople = (params) => post(`people/update`,params);
//删除
export const delPeople = (id) => get(`people/delete?id=${id}`);

//============相关================
//根据id查询
export const objectOfPeopleId =(id) => get(`object/people/detail?peopleId=${id}`);
//编辑
export const updateObject = (params) => post(`object/update`,params);
//删除
export const delObject = (id) => get(`object/delete?id=${id}`);
//根据id查询对象
export const objectOfObjectId =(id) => get(`object/detail?objectId=${id}`);
//根据名获取对象
export const objectOfObjectName =(objectName) => get(`object/objectOfObjectName?objectName=${objectName}`);
//查询所有
export const allObject =() => get(`object/allObject`);

//============相关================
//查询
export const getAllObjectList =() => get(`objectList/allObjectList`);
//添加
export const setObjectList = (params) => post(`objectList/add`,params);
//编辑
export const updateObjectList = (params) => post(`objectList/update`,params);
//删除
export const delObjectList = (id) => get(`objectList/delete?id=${id}`);

//============相关============
//根据id查询列表
export const listObjectDetail = (objectListId) => get(`listObject/detail?objectListId=${objectListId}`);
//给增加
export const listObjectAdd = (params) => post(`listObject/add`,params);
//删除的
export const delListObject = (objectId,objectListId) => get(`listObject/delete?objectId=${objectId}&objectListId=${objectListId}`);

//============用户相关================
//查询用户
export const getAllConsumer =() => get(`user/allConsumer`);
//添加用户
export const setConsumer = (params) => post(`consumer/add`,params);
//编辑用户
export const updateConsumer = (params) => post(`consumer/update`,params);
//删除用户
export const delConsumer = (id) => get(`consumer/delete?id=${id}`);
//根据用户id查询该用户的详细信息
export const getUserOfId =(id) => get(`/consumer/selectByPrimaryKey?id=${id}`);

//===============收藏===================
//指定用户的收藏列表
export const getCollectOfUserId = (userId) => get(`/collect/collectOfUserId?userId=${userId}`);
//删除用户收藏的
export const deleteCollection = (userId,objectId) => get(`collect/delete?userId=${userId}&objectId=${objectId}`);

//===============评论===================
//指定的评论列表
export const getCommentOfObjectListId = (objectListId) => get(`/comment/commentOfObjectListId?objectListId=${objectListId}`);
//删除评论
export const deleteComment = (id) => get(`comment/delete?id=${id}`);

