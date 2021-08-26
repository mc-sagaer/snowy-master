import { axios } from '@/utils/request'

/**
 * 查询用户表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsPage (parameter) {
  return axios({
    url: '/zzAdfs/page',
    method: 'get',
    params: parameter
  })
}

/**
 * 用户表列表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsList (parameter) {
  return axios({
    url: '/zzAdfs/list',
    method: 'get',
    params: parameter
  })
}

/**
 * 添加用户表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsAdd (parameter) {
  return axios({
    url: '/zzAdfs/add',
    method: 'post',
    data: parameter
  })
}

/**
 * 编辑用户表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsEdit (parameter) {
  return axios({
    url: '/zzAdfs/edit',
    method: 'post',
    data: parameter
  })
}

/**
 * 删除用户表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsDelete (parameter) {
  return axios({
    url: '/zzAdfs/delete',
    method: 'post',
    data: parameter
  })
}

/**
 * 导出用户表
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
export function zzAdfsExport (parameter) {
  return axios({
    url: '/zzAdfs/export',
    method: 'get',
    params: parameter,
    responseType: 'blob'
  })
}
