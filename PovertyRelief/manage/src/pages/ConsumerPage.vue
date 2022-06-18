<template>
  <div>
    <div class="container">
      <div class="handle-box">
        <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加新用户</el-button>
      </div>
    </div>
    <el-table
      :data="page.records"
      style="width: 100%">
      <el-table-column
        label="头像"
        width="100">
        <template slot-scope="aaa">
          <img :src="aaa.row.avatar" style="width: 100%">
        </template>

      </el-table-column>
      <el-table-column
        prop="username"
        label="用户名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="tel"
        label="电话">
      </el-table-column>
      <el-table-column width="50"
                       prop="gender"
                       label="性别">
      </el-table-column>
      <el-table-column width="50"
                       prop="age"
                       label="年龄">
      </el-table-column>
      <el-table-column
        prop="email"
        label="邮箱">
      </el-table-column>
      <el-table-column
        prop="nickname"
        label="昵称">
      </el-table-column>
      <el-table-column width="150"
                       label="是否贫困户">
        <template slot-scope="aaa">
          <el-tag v-if="aaa.row.realName" size="small">是</el-tag>
          <el-button v-if="aaa.row.realName" @click="changeTokenDialog(aaa.row.id)" type="success" size="small">修改代币</el-button>

          <el-tag v-if="!aaa.row.realName" size="small">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="250">
        <template slot-scope="aaa">
          <el-button @click="deleteById(aaa.row.id)" size="mini" type="danger">删除</el-button>
          <el-button @click="update(aaa.row.id)" size="mini" type="primary">编辑</el-button>
          <el-button @click="cancelPoverty(aaa.row.id)" size="mini" v-if="aaa.row.realName" type="warning">取消贫困
          </el-button>
          <el-button @click="poverty(aaa.row.id)" size="mini" v-if="!aaa.row.realName" type="success">标为贫困</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background :page-size="8" :page-count="page.pages" :current-page="page.current"
                   layout="prev, pager, next" :total="page.total" @current-change="currentChange"
                   :hide-on-single-page="true">
    </el-pagination>


<!--    //添加新用户-->
    <el-dialog title="添加新用户" :visible.sync="centerDialogVisible" width="400px" center>
      <el-form :model="user" ref="user" label-width="80px" :rules="rules">
        <el-form-item prop="username" label="用户名" size="mini">
          <el-input v-model="user.username" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item prop="cover" label="头像" size="mini">
          <input
            class="form-control"
            name="file"
            type="file"
            accept="image/png,image/gif,image/jpeg"
            @change="uploadCover"
          />
        </el-form-item>
        <el-form-item prop="password" label="密码" size="mini">
          <el-input type="password" v-model="user.password" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini">
          <input type="radio" name="gender" value="女" v-model="user.gender">&nbsp;女&nbsp;&nbsp;
          <input type="radio" name="gender" value="男" v-model="user.gender">&nbsp;男
        </el-form-item>
        <el-form-item prop="tel" label="手机号" size="mini">
          <el-input v-model="user.tel" placeholder="手机号"></el-input>
        </el-form-item>
        <el-form-item prop="email" label="电子邮箱" size="mini">
          <el-input v-model="user.email" placeholder="电子邮箱"></el-input>
        </el-form-item>
        <el-form-item prop="nickname" label="昵称" size="mini">
          <el-input v-model="user.nickname" placeholder="昵称"></el-input>
        </el-form-item>
        <el-form-item prop="age" label="年龄" size="mini">
          <el-input v-model="user.age" placeholder="年龄"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addConsumer">确定</el-button>
            </span>
    </el-dialog>


<!--    //编辑用户-->
    <el-dialog title="编辑用户" :visible.sync="centerDialogVisible2" width="400px" center>
      <el-form :model="updateUser" ref="updateUser" label-width="80px" :rules="rules">
        <el-form-item prop="username" label="用户名" size="mini">
          <el-input v-model="updateUser.username" placeholder="用户名" disabled></el-input>
        </el-form-item>
        <el-form-item prop="cover" label="头像" size="mini">
          <input
            class="form-control"
            name="file"
            type="file"
            accept="image/png,image/gif,image/jpeg"
            @change="uploadCover1"
          />
        </el-form-item>
        <el-form-item prop="password" label="密码" size="mini">
          <el-input type="password" v-model="updateUser.password" placeholder="密码"></el-input>
          <el-input type="hidden" v-model="updateUser.id"></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini">
          <input type="radio" name="gender" value="女" v-model="updateUser.gender">&nbsp;女&nbsp;&nbsp;
          <input type="radio" name="gender" value="男" v-model="updateUser.gender">&nbsp;男
        </el-form-item>
        <el-form-item prop="tel" label="手机号" size="mini">
          <el-input v-model="updateUser.tel" placeholder="手机号"></el-input>
        </el-form-item>
        <el-form-item prop="email" label="电子邮箱" size="mini">
          <el-input v-model="updateUser.email" placeholder="电子邮箱"></el-input>
        </el-form-item>
        <el-form-item prop="nickname" label="昵称" size="mini">
          <el-input v-model="updateUser.nickname" placeholder="昵称"></el-input>
        </el-form-item>
        <el-form-item prop="age" label="年龄" size="mini">
          <el-input v-model="updateUser.age" placeholder="年龄"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible2 = false">取消</el-button>
                <el-button size="mini" @click="updateUserM">确定</el-button>
            </span>
    </el-dialog>


<!--    //设置贫困用户-->
    <el-dialog title="登记贫困用户" :visible.sync="centerDialogVisible3" width="400px" center>
      <el-form :model="povertyUser" ref="povertyUser" label-width="80px">
        <el-form-item prop="realName" label="真实姓名" size="mini">
          <el-input v-model="povertyUser.realName" placeholder="真实姓名" ></el-input>
        </el-form-item>
        <el-form-item prop="idCard" label="身份证号" size="mini">
          <el-input v-model="povertyUser.idCard" placeholder="身份证号" ></el-input>
        </el-form-item>
        <el-form-item prop="address" label="详细地址" size="mini">
          <el-input v-model="povertyUser.address" placeholder="详细地址" ></el-input>
        </el-form-item>
        <el-form-item prop="cover" label="真实头像" size="mini">
          <input
            class="form-control"
            name="file"
            type="file"
            accept="image/png,image/gif,image/jpeg"
            @change="uploadCover3"
          />
        </el-form-item>

      </el-form>
      <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible3 = false">取消</el-button>
                <el-button size="mini" @click="povertyM">确定</el-button>
            </span>
    </el-dialog>

<!--    //设置贫困代币-->
    <el-dialog title="设置贫困代币" :visible.sync="centerDialogVisible4" width="400px" center>
      <el-form label-width="80px">
        <el-form-item label="余额" size="mini">
          <el-input type="number" step="0.01" v-model="token.balance" placeholder="" ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible4 = false">取消</el-button>
                <el-button size="mini" @click="changeToken">确定</el-button>
            </span>
    </el-dialog>
  </div>

</template>

<script>
import {getAllConsumer} from "../api";

export default {
  data() {
    return {
      updateUser: {},
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'}
        ],
        phoneNum: [
          {required: true, message: '请输入手机号', trigger: 'blur'}
        ],
        email: [
          {required: true, message: '请输入电子邮箱', trigger: 'blur'},
          {type: 'email', message: '请输入正确的电子邮箱地址', trigger: ['blur', 'change']}
        ],
        introduction: [
          {required: true, message: '请输入昵称', trigger: 'blur'}
        ],
        location: [
          {required: true, message: '请输入地区', trigger: 'blur'}
        ]
      },
      centerDialogVisible: false,
      centerDialogVisible2: false,
      centerDialogVisible3: false,
      centerDialogVisible4: false,
      povertyUser:{},
      user: {},
      page: {},
      data: [],
      token:{},
    }
  },
  methods: {
    changeToken(){
      this.$axios.post("/token/update",this.token).then(resp=>{
        this.$message({
          type:"success",
          message:resp.data.data
        })
        this.centerDialogVisible4=false
        this.token={}
      })
    },
    changeTokenDialog(id){
      this.centerDialogVisible4=true
        this.$axios.get("/token/selectById?id="+id).then(resp=>{
        this.token = resp.data.data
      })
    },
    povertyM(){
      if (this.povertyUser.realName == null || this.povertyUser.username == ""
        || this.povertyUser.idCard == null || this.povertyUser.password == ""
        || this.povertyUser.picture == null || this.povertyUser.picture == "") {
        this.$message({
          type: "warning",
          message: "请填写完整信息"
        })
        return
      }
      console.log(this.povertyUser)
      this.$axios.post("/poverty-user/adminInsert",this.povertyUser).then(resp => {
        this.$message({
          type: "success",
          message: resp.data.data
        })
        this.povertyUser={}
        this.centerDialogVisible3 = false
      })
    },
    poverty(id){
      this.centerDialogVisible3 = true
      // this.$axios.get("/user/selectById?id=" + id).then(resp => {
        this.povertyUser.userId = id
      // })
    },
    cancelPoverty(id) {
      this.$axios.post("/user/cancelPoverty?id=" + id).then(resp => {
        this.$message({
          type: "warning",
          message: resp.data.data
        })
        this.selectPage(this.page.current)
      })
    },
    update(id) {
      this.centerDialogVisible2 = true
      this.$axios.get("/user/selectById?id=" + id).then(resp => {
        this.updateUser = resp.data.data.user
      })
    },
    updateUserM() {
      if (this.updateUser.username == null || this.updateUser.username == ""
        || this.updateUser.password == null || this.updateUser.password == "") {
        this.$message({
          type: "warning",
          message: "请填写完整信息"
        })
        return
      }
      this.$axios.post("/user/update", this.updateUser).then(resp => {
        if (resp.data.code == 200) {
          this.centerDialogVisible2 = false
          this.selectPage(this.page.current)
        }
        this.$message({
          type: "success",
          message: resp.data.message
        })
      })
    },
    addConsumer() {
      if (this.user.username == null || this.user.username == ""
        || this.user.password == null || this.user.password == "") {
        this.$message({
          type: "warning",
          message: "请填写完整信息"
        })
        return
      }
      this.$axios.post("/user/insert", this.user).then(resp => {
        if (resp.data.code == 200) {
          this.centerDialogVisible = false
          this.user = {}
          this.selectPage(this.page.current)
        }
        this.$message({
          type: "success",
          message: resp.data.message
        })
      })
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
          this.user.avatar = response.data.data;
        });
    },
    uploadCover3(e) {
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
          this.povertyUser.picture = response.data.data;
        });
    },
    uploadCover1(e) {
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
          this.updateUser.avatar = response.data.data;
        });
    },
    deleteById(id) {
      console.log("delete")
      this.$confirm('此操作将删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/user/delete?id=" + id).then(resp => {
          this.$message({
            type: 'success',
            message: resp.data.data
          });
          this.selectPage(this.page.current)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      })
    },
    currentChange(currentPage) {
      console.log(currentPage)
      this.page.current = currentPage
      this.selectPage(this.page.current)
    },
    selectPage(current) {
      this.$axios.get("/user/selectByPage?current=" + current + "&size=8").then(resp => {
        this.page = resp.data.data
      })
    },
  },
  created() {
    this.selectPage(1)
  }
}
</script>
