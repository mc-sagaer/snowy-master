import { axios } from '@/utils/request'

/**
 * 查询用户表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userPage (parameter) {
  return axios({
    url: '/user/page',
    method: 'get',
    params: parameter
  })
}

/**
 * 用户表列表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userList (parameter) {
  return axios({
    url: '/user/list',
    method: 'get',
    params: parameter
  })
}

/**
 * 添加用户表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userAdd (parameter) {
  return axios({
    url: '/user/add',
    method: 'post',
    data: parameter
  })
}

/**
 * 编辑用户表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userEdit (parameter) {
  return axios({
    url: '/user/edit',
    method: 'post',
    data: parameter
  })
}

/**
 * 删除用户表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userDelete (parameter) {
  return axios({
    url: '/user/delete',
    method: 'post',
    data: parameter
  })
}

/**
 * 导出用户表
 *
 * @author mch
 * @date 2021-08-03 16:51:50
 */
export function userExport (parameter) {
  return axios({
    url: '/user/export',
    method: 'get',
    params: parameter,
    responseType: 'blob'
  })
}
