<template>
  <div>

    <el-table
      :data="page.records"
      style="width: 100%">

      <el-table-column
        prop="userId"
        label="用户id">
      </el-table-column>

      <el-table-column
        prop="realName"
        label="真实姓名">
      </el-table-column>

      <el-table-column
        label="身份证">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.idCard }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column
        prop="address"
        label="地址">
      </el-table-column>

      <el-table-column
        prop="money"
        label="申请金额">
      </el-table-column>

      <el-table-column
        prop="reason"
        label="申请原因">
      </el-table-column>


      <el-table-column label="操作">
        <template slot-scope="aaa">
          <el-button @click="deleteById(aaa.row.id)" size="mini" type="danger">不通过</el-button>
          <el-button @click="audit(aaa.row.id)" size="mini" type="success">通过</el-button>
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
    audit(id){
      this.$axios("/token-apply/audit?id=" + id).then(resp => {
        this.$message({
          type: "success",
          message: resp.data.data
        })
        this.selectPage(this.page.current)
      })
    },
    deleteById(id) {
      this.$confirm('此操作将删除该请求, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios("/token-apply/delete?id=" + id).then(resp => {
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
      this.$axios.post("/token-apply/selectPage?current=" + current + "&size=8").then(resp => {
        this.page = resp.data.data
      })
    }
  },
  created() {
    this.selectPage(1)
  }
}
</script>
