<template>
  <div>
    <a-card :bordered="false" :bodyStyle="tstyle">
      <div class="table-page-search-wrapper" v-if="hasPerm('station:page')">
        <a-form layout="inline">
          <a-row :gutter="48">
            <a-col :md="8" :sm="24">
              <a-form-item label="唯一资源id">
                <a-input v-model="queryParam.objid" allow-clear placeholder="请输入唯一资源id"/>
              </a-form-item>
            </a-col>
            <a-col :md="8" :sm="24">
              <a-form-item label="创建时间">
                <a-date-picker style="width: 100%" placeholder="请选择创建时间" v-model="queryParam.cdateDate" @change="onChangecdate"/>
              </a-form-item>
            </a-col>
            <template v-if="advanced">
              <a-col :md="8" :sm="24">
                <a-form-item label="操作人">
                  <a-input v-model="queryParam.operator" allow-clear placeholder="请输入操作人"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="操作人id">
                  <a-input v-model="queryParam.operatorId" allow-clear placeholder="请输入操作人id"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="省">
                  <a-input v-model="queryParam.province" allow-clear placeholder="请输入省"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="市">
                  <a-input v-model="queryParam.city" allow-clear placeholder="请输入市"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="县">
                  <a-input v-model="queryParam.county" allow-clear placeholder="请输入县"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="集控中心">
                  <a-input v-model="queryParam.controlCenter" allow-clear placeholder="请输入集控中心"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="变电站名称">
                  <a-input v-model="queryParam.stationName" allow-clear placeholder="请输入变电站名称"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="电压等级">
                  <a-input v-model="queryParam.voltageLevel" allow-clear placeholder="请输入电压等级"/>
                </a-form-item>
              </a-col>
              <a-col :md="8" :sm="24">
                <a-form-item label="照片">
                  <a-input v-model="queryParam.photo" allow-clear placeholder="请输入照片"/>
                </a-form-item>
              </a-col>
            </template>
            <a-col :md="8" :sm="24" >
              <span class="table-page-search-submitButtons">
                <a-button type="primary" @click="$refs.table.refresh(true)" >查询</a-button>
                <a-button style="margin-left: 8px" @click="() => queryParam = {}">重置</a-button>
                <a @click="toggleAdvanced" style="margin-left: 8px">
                  {{ advanced ? '收起' : '展开' }}
                  <a-icon :type="advanced ? 'up' : 'down'"/>
                </a>
              </span>
            </a-col>
          </a-row>
        </a-form>
      </div>
    </a-card>
    <a-card :bordered="false">
      <s-table
        ref="table"
        :columns="columns"
        :data="loadData"
        :alert="options.alert"
        :rowKey="(record) => record.id"
        :rowSelection="options.rowSelection"
      >
        <template class="table-operator" slot="operator" v-if="hasPerm('station:add')" >
          <a-button type="primary" v-if="hasPerm('station:add')" icon="plus" @click="$refs.addForm.add()">新增变电站基本信息</a-button>
          <a-button type="danger" :disabled="selectedRowKeys.length < 1" v-if="hasPerm('station:delete')" @click="batchDelete"><a-icon type="delete"/>批量删除</a-button>
          <x-down
            v-if="hasPerm('station:export')"
            ref="batchExport"
            @batchExport="batchExport"
          />
        </template>
        <span slot="action" slot-scope="text, record">
          <a v-if="hasPerm('station:edit')" @click="$refs.editForm.edit(record)">编辑</a>
          <a-divider type="vertical" v-if="hasPerm('station:edit') & hasPerm('station:delete')"/>
          <a-popconfirm v-if="hasPerm('station:delete')" placement="topRight" title="确认删除？" @confirm="() => singleDelete(record)">
            <a>删除</a>
          </a-popconfirm>
        </span>
      </s-table>
      <add-form ref="addForm" @ok="handleOk" />
      <edit-form ref="editForm" @ok="handleOk" />
    </a-card>
  </div>
</template>
<script>
  import { STable, XDown } from '@/components'
  import moment from 'moment'
  import { stationPage, stationDelete, stationExport } from '@/api/modular/main/station/stationManage'
  import addForm from './addForm.vue'
  import editForm from './editForm.vue'
  export default {
    components: {
      STable,
      addForm,
      editForm,
      XDown
    },
    data () {
      return {
        // 高级搜索 展开/关闭
        advanced: false,
        // 查询参数
        queryParam: {},
        // 表头
        columns: [
          {
            title: '唯一资源id',
            align: 'center',
            dataIndex: 'objid'
          },
          {
            title: '创建时间',
            align: 'center',
            dataIndex: 'cdate'
          },
          {
            title: '操作人',
            align: 'center',
            dataIndex: 'operator'
          },
          {
            title: '操作人id',
            align: 'center',
            dataIndex: 'operatorId'
          },
          {
            title: '省',
            align: 'center',
            dataIndex: 'province'
          },
          {
            title: '市',
            align: 'center',
            dataIndex: 'city'
          },
          {
            title: '县',
            align: 'center',
            dataIndex: 'county'
          },
          {
            title: '集控中心',
            align: 'center',
            dataIndex: 'controlCenter'
          },
          {
            title: '变电站名称',
            align: 'center',
            dataIndex: 'stationName'
          },
          {
            title: '电压等级',
            align: 'center',
            dataIndex: 'voltageLevel'
          },
          {
            title: '照片',
            align: 'center',
            dataIndex: 'photo'
          }
        ],
        tstyle: { 'padding-bottom': '0px', 'margin-bottom': '10px' },
        // 加载数据方法 必须为 Promise 对象
        loadData: parameter => {
          return stationPage(Object.assign(parameter, this.switchingDate())).then((res) => {
            return res.data
          })
        },
        selectedRowKeys: [],
        selectedRows: [],
        options: {
          alert: { show: true, clear: () => { this.selectedRowKeys = [] } },
          rowSelection: {
            selectedRowKeys: this.selectedRowKeys,
            onChange: this.onSelectChange
          }
        }
      }
    },
    created () {
      if (this.hasPerm('station:edit') || this.hasPerm('station:delete')) {
        this.columns.push({
          title: '操作',
          width: '150px',
          dataIndex: 'action',
          scopedSlots: { customRender: 'action' }
        })
      }
    },
    methods: {
      moment,
      /**
       * 查询参数组装
       */
      switchingDate () {
        const queryParamcdate = this.queryParam.cdateDate
        if (queryParamcdate != null) {
            this.queryParam.cdate = moment(queryParamcdate).format('YYYY-MM-DD')
            if (queryParamcdate.length < 1) {
                delete this.queryParam.cdate
            }
        }
        const obj = JSON.parse(JSON.stringify(this.queryParam))
        return obj
      },
      /**
       * 单个删除
       */
      singleDelete (record) {
        const param = [{ 'id': record.id }]
        this.stationDelete(param)
      },
      /**
       * 批量删除
       */
      batchDelete () {
        const paramIds = this.selectedRowKeys.map((d) => {
            return { 'id': d }
        })
        this.stationDelete(paramIds)
      },
      stationDelete (record) {
        stationDelete(record).then((res) => {
          if (res.success) {
            this.$message.success('删除成功')
            this.$refs.table.clearRefreshSelected()
          } else {
            this.$message.error('删除失败') // + res.message
          }
        })
      },
      toggleAdvanced () {
        this.advanced = !this.advanced
      },
      onChangecdate(date, dateString) {
        this.cdateDateString = dateString
      },
      /**
       * 批量导出
       */
      batchExport () {
        const paramIds = this.selectedRowKeys.map((d) => {
            return { 'id': d }
        })
        stationExport(paramIds).then((res) => {
            this.$refs.batchExport.downloadfile(res)
        })
      },
      handleOk () {
        this.$refs.table.refresh()
      },
      onSelectChange (selectedRowKeys, selectedRows) {
        this.selectedRowKeys = selectedRowKeys
        this.selectedRows = selectedRows
      }
    }
  }
</script>
<style lang="less">
  .table-operator {
    margin-bottom: 18px;
  }
  button {
    margin-right: 8px;
  }
</style>
