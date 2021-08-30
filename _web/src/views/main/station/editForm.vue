<template>
  <a-modal
    title="编辑变电站基本信息"
    :width="900"
    :visible="visible"
    :confirmLoading="confirmLoading"
    @ok="handleSubmit"
    @cancel="handleCancel"
  >
    <a-spin :spinning="confirmLoading">
      <a-form :form="form">
        <a-form-item v-show="false"><a-input v-decorator="['id']" /></a-form-item>
        <a-form-item
          label="唯一资源id"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入唯一资源id" v-decorator="['objid', {rules: [{required: true, message: '请输入唯一资源id！'}]}]" />
        </a-form-item>
        <a-form-item
          label="创建时间"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-date-picker style="width: 100%" placeholder="请选择创建时间" v-decorator="['cdate',{rules: [{ required: true, message: '请选择创建时间！' }]}]" @change="onChangecdate"/>
        </a-form-item>
        <a-form-item
          label="操作人"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入操作人" v-decorator="['operator', {rules: [{required: true, message: '请输入操作人！'}]}]" />
        </a-form-item>
        <a-form-item
          label="操作人id"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入操作人id" v-decorator="['operatorId', {rules: [{required: true, message: '请输入操作人id！'}]}]" />
        </a-form-item>
        <a-form-item
          label="省"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入省" v-decorator="['province', {rules: [{required: true, message: '请输入省！'}]}]" />
        </a-form-item>
        <a-form-item
          label="市"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入市" v-decorator="['city', {rules: [{required: true, message: '请输入市！'}]}]" />
        </a-form-item>
        <a-form-item
          label="县"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入县" v-decorator="['county', {rules: [{required: true, message: '请输入县！'}]}]" />
        </a-form-item>
        <a-form-item
          label="集控中心"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入集控中心" v-decorator="['controlCenter', {rules: [{required: true, message: '请输入集控中心！'}]}]" />
        </a-form-item>
        <a-form-item
          label="变电站名称"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入变电站名称" v-decorator="['stationName', {rules: [{required: true, message: '请输入变电站名称！'}]}]" />
        </a-form-item>
        <a-form-item
          label="电压等级"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入电压等级" v-decorator="['voltageLevel', {rules: [{required: true, message: '请输入电压等级！'}]}]" />
        </a-form-item>
        <a-form-item
          label="照片"
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          has-feedback
        >
          <a-input placeholder="请输入照片" v-decorator="['photo', {rules: [{required: true, message: '请输入照片！'}]}]" />
        </a-form-item>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>
  import moment from 'moment'
  import { stationEdit } from '@/api/modular/main/station/stationManage'
  export default {
    data () {
      return {
        labelCol: {
          xs: { span: 24 },
          sm: { span: 5 }
        },
        wrapperCol: {
          xs: { span: 24 },
          sm: { span: 15 }
        },
        cdateDateString: '',
        visible: false,
        confirmLoading: false,
        form: this.$form.createForm(this)
      }
    },
    methods: {
      moment,
      // 初始化方法
      edit (record) {
        this.visible = true
        setTimeout(() => {
          this.form.setFieldsValue(
            {
              id: record.id,
              objid: record.objid,
              operator: record.operator,
              operatorId: record.operatorId,
              province: record.province,
              city: record.city,
              county: record.county,
              controlCenter: record.controlCenter,
              stationName: record.stationName,
              voltageLevel: record.voltageLevel,
              photo: record.photo
            }
          )
        }, 100)
        // 时间单独处理
        if (record.cdate != null) {
            this.form.getFieldDecorator('cdate', { initialValue: moment(record.cdate, 'YYYY-MM-DD') })
        }
        this.cdateDateString = moment(record.cdate).format('YYYY-MM-DD')
      },
      handleSubmit () {
        const { form: { validateFields } } = this
        this.confirmLoading = true
        validateFields((errors, values) => {
          if (!errors) {
            for (const key in values) {
              if (typeof (values[key]) === 'object') {
                values[key] = JSON.stringify(values[key])
              }
            }
            values.cdate = this.cdateDateString
            stationEdit(values).then((res) => {
              if (res.success) {
                this.$message.success('编辑成功')
                this.confirmLoading = false
                this.$emit('ok', values)
                this.handleCancel()
              } else {
                this.$message.error('编辑失败')//  + res.message
              }
            }).finally((res) => {
              this.confirmLoading = false
            })
          } else {
            this.confirmLoading = false
          }
        })
      },
      onChangecdate(date, dateString) {
        this.cdateDateString = dateString
      },
      handleCancel () {
        this.form.resetFields()
        this.visible = false
      }
    }
  }
</script>
