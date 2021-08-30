import { axios } from '@/utils/request'

/**
 * 查询变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationPage (parameter) {
  return axios({
    url: '/station/page',
    method: 'get',
    params: parameter
  })
}

/**
 * 变电站基本信息列表
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationList (parameter) {
  return axios({
    url: '/station/list',
    method: 'get',
    params: parameter
  })
}

/**
 * 添加变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationAdd (parameter) {
  return axios({
    url: '/station/add',
    method: 'post',
    data: parameter
  })
}

/**
 * 编辑变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationEdit (parameter) {
  return axios({
    url: '/station/edit',
    method: 'post',
    data: parameter
  })
}

/**
 * 删除变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationDelete (parameter) {
  return axios({
    url: '/station/delete',
    method: 'post',
    data: parameter
  })
}

/**
 * 导出变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:29:17
 */
export function stationExport (parameter) {
  return axios({
    url: '/station/export',
    method: 'get',
    params: parameter,
    responseType: 'blob'
  })
}
