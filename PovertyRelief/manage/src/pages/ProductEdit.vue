<template>
  <div>
    <br/>
    <el-form label-width="80px" size="small" label-position="right">
      <el-form-item label="名称" prop="title">
        <el-input auto-complete="off" v-model="title"></el-input>
      </el-form-item>
      <el-form-item label="库存" prop="stock">
        <el-input type="number" auto-complete="off" v-model="stock"></el-input>
      </el-form-item>
      <el-form-item label="单价" prop="stock">
        <el-input type="number" step="0.01" auto-complete="off" v-model="price"></el-input>
      </el-form-item>
      <el-form-item label="用户id" prop="stock">
        <el-input auto-complete="off" v-model="releaseUserId"></el-input>
      </el-form-item>

      <el-form-item label="封面">
        <img style="padding-bottom:15px" v-if="cover" :src="cover" class="avatar" width="400"/>
        <br/>

        <input
            class="form-control"
            name="file"
            type="file"
            accept="image/png,image/gif,image/jpeg"
            @change="uploadCover"
        />
      </el-form-item>
      <el-form-item label="正文">
        <div id="wangEditor" style="text-align: center"></div>
        <el-button type="success" @click="submit">提交</el-button>
      </el-form-item>

    </el-form>

  </div>
</template>
<script>
import E from "wangeditor";
import OSS from "ali-oss";
import {getAllConsumer} from "../api";

export default {
  components: {},
  data() {
    return {
      title: "",
      cover: "",
      stock:"",
      price:"",
      releaseUserId:"",
      id:"",
    };
  },
  methods: {
    submit() {
      if (this.title==""||this.title==null
        ||this.stock == ""||this.stock==null
        ||this.price==""||this.price==null){
        this.$message({
          type: "warning",
          message: "请填写完整信息!",
        });
        return
      }
      this.$axios.post("/product/update", {
        id: this.id,
        cover: this.cover,
        detail: this.editor.txt.html(),
        title : this.title,
        stock:this.stock,
        price:this.price,
        releaseUserId:this.releaseUserId
      }).then((resp) => {
        if (resp.data.code == 200) {
          this.$message({
            message: resp.data.data,
            type: "success",
          });
          history.go(-1)
        }
      });
    },
    uploadCover(e) {
      let file = e.target.files[0];
      let param = new FormData(); //创建form对象
      param.append("avatarFile", file); //通过append向form对象添加数据
      console.log(param.get("avatarFile")); //FormData私有类对象，访问不到，可以通过get判断值是否传进去
      let config = {
        headers: {"Content-Type": "multipart/form-data"},
      }; //添加请求头
      this.$axios
          .post("/donation/uploadCover", param, config)
          .then((response) => {
            this.cover = response.data.data;
          });
    },
    getData(){
      this.$axios.post("/product/selectById?id="+this.$route.params.id).then(resp=>{
        this.id = resp.data.data.id
        this.title = resp.data.data.title
        this.stock = resp.data.data.stock
        this.price = resp.data.data.price
        this.cover = resp.data.data.cover
        this.releaseUserId = resp.data.data.releaseUserId
        this.editor.txt.html(resp.data.data.detail);
      })
    }
  },
  mounted() {
    this.getData();
    this.editor = new E("#wangEditor");
    this.editor.config.uploadImgAccept = [];

    let ossClient = new OSS({
      // // region以杭州为例（oss-cn-hangzhou），其他region按实际情况填写。
      region: "oss-cn-beijing",
      // // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，请登录RAM控制台创建RAM账号。
      accessKeyId: "LTAI5t7KPS2SN4y3hU2jcwZo",
      accessKeySecret: "lLFSyfEPxkrywnat0r2EdyAZYmj7kk",
      bucket: "yinwj",
    });
    // 默认限制图片大小是 5M ，可以自己修改。
    this.editor.config.uploadImgMaxSize = 10 * 1024 * 1024;
    this.editor.config.customUploadImg = function (resultFiles, insertImgFn) {
      // resultFiles 是 input 中选中的文件列表
      // insertImgFn 是获取图片 url 后，插入到编辑器的方法
      let date = new Date();
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      let day = date.getDate();
      var timestamp = Date.parse(new Date());
      ossClient
          .put(
              year +
              "/" +
              month +
              "/" +
              day +
              "/" +
              timestamp +
              resultFiles[0].name,
              resultFiles[0]
          )
          .then(function (res) {
            // 上传图片，返回结果，将图片插入到编辑器中
            insertImgFn(res.url);
            let url = document.getElementById("url");
            var span = document.createElement("span");
            span.innerHTML = res.url + "<br>";
            url.appendChild(span);
          })
          .catch(function (err) {
            console.log(err);
          });
    };
    // 默认限制图片大小是 5M ，可以自己修改。
    this.editor.config.uploadVideoMaxSize = 200 * 1024 * 1024;
    this.editor.config.customUploadVideo = function (
        resultFiles,
        insertVideoFn
    ) {
      // resultFiles 是 input 中选中的文件列表
      // insertVideoFn 是获取视频 url 后，插入到编辑器的方法
      var timestamp = Date.parse(new Date());
      let date = new Date();
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      let day = date.getDate();
      ossClient
          .put(
              year +
              "/" +
              month +
              "/" +
              day +
              "/" +
              timestamp +
              resultFiles[0].name,
              resultFiles[0]
          )
          .then(function (res) {
            // 上传视频，返回结果，将视频插入到编辑器中
            insertVideoFn(res.url);
          })
          .catch(function (err) {
            console.log(err);
          });
    };
    this.editor.config.height = 800;
    this.editor.create();
  },
};
</script>
<style scoped>
</style>
