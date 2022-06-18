<template>
  <div>

    <el-table
      :data="page.records"
      style="width: 100%">
      <el-table-column
        prop="title"
        label="商品标题">
      </el-table-column>

      <el-table-column
        label="单价">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.price }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="份数">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.copies }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="付款">
        <template slot-scope="aaa">
          <el-tag size="small">{{ aaa.row.totalPrice }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column
        prop="peopleName"
        label="姓名">
      </el-table-column>
      <el-table-column
        prop="peopleTel"
        label="电话">
      </el-table-column>
      <el-table-column
        prop="peopleAddress"
        label="地址">
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="aaa">
          <el-button @click="deleteById(aaa.row.id)" size="mini" type="danger">删除</el-button>
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
      this.$confirm('此操作将删除该订单, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios("/product-order/delete?id=" + id).then(resp => {
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
      this.$axios.post("/product-order/selectPageAdmin?current=" + current + "&size=8").then(resp => {
        this.page = resp.data.data
      })
    }
  },
  created() {
    this.selectPage(1)
  }
}
</script>
