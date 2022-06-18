<template>
  <div>
    <div class="container">
      <div class="handle-box">
        <router-link :to="{path:'donationadd'}">
          <el-button type="primary" size="mini">添加</el-button>
        </router-link>
      </div>
    </div>
    <el-table
      :data="page.records"
      style="width: 100%">
      <el-table-column
        label="封面"
        width="200">
        <template slot-scope="aaa">
          <img :src="aaa.row.cover" style="width: 100%">
        </template>

      </el-table-column>
      <el-table-column
        prop="title"
        label="标题">
      </el-table-column>
      <el-table-column
        label="库存">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.stock }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="单价">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.price }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="aaa">
          <el-button @click="deleteById(aaa.row.id)" size="mini" type="danger">删除</el-button>
          <router-link :to="{path:'/donationedit/'+aaa.row.id}">
            <el-button size="mini" type="primary">编辑</el-button>
          </router-link>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background :page-size="8" :page-count="page.pages" :current-page="page.current"
                   layout="prev, pager, next" :total="page.total" @current-change="currentChange"
                   :hide-on-single-page="true">
    </el-pagination>
  </div>

</template>

<script>
import {getAllConsumer} from "../api";

export default {
  data() {
    return {
      page: {},
    }
  },
  methods: {

    deleteById(id) {
      this.$confirm('此操作将删除该捐赠物, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/donation/delete?id=" + id).then(resp => {
          this.$message({
            type: "warning",
            message: resp.data.data
          })
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
      this.$axios.post("/donation/selectPage?current=" + current + "&size=8").then(resp => {
        this.page = resp.data.data
      })
    }
  },
  created() {
    this.selectPage(1)
  }
}
</script>
