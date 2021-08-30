/*
Copyright [2020] [https://www.xiaonuo.vip]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Snowy采用APACHE LICENSE 2.0开源协议，您在使用过程中，需要注意以下几点：

1.请不要删除和修改根目录下的LICENSE文件。
2.请不要删除和修改Snowy源码头部的版权声明。
3.请保留源码和相关描述文件的项目出处，作者声明等。
4.分发源码时候，请注明软件出处 https://gitee.com/xiaonuobase/snowy
5.在修改包名，模块名称，项目代码等时，请注明软件出处 https://gitee.com/xiaonuobase/snowy
6.若您的项目无法满足以上几点，可申请商业授权，获取Snowy商业授权许可，请在官网购买授权，地址为 https://www.xiaonuo.vip
 */
package com.mch.modular.station.param;

import com.mch.core.pojo.base.param.BaseParam;
import lombok.Data;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.NotBlank;

/**
* 变电站基本信息参数类
 *
 * @author mach
 * @date 2021-08-27 09:48:02
*/
@Data
public class StationParam extends BaseParam {

    /**
     * id
     */
    @NotNull(message = "id不能为空，请检查id参数", groups = {edit.class, delete.class, detail.class})
    private Integer id;

    /**
     * 唯一资源id
     */
    @NotBlank(message = "唯一资源id不能为空，请检查objid参数", groups = {add.class, edit.class})
    private String objid;

    /**
     * 创建时间
     */
    @NotNull(message = "创建时间不能为空，请检查cdate参数", groups = {add.class, edit.class})
    private String cdate;

    /**
     * 操作人
     */
    @NotBlank(message = "操作人不能为空，请检查operator参数", groups = {add.class, edit.class})
    private String operator;

    /**
     * 操作人id
     */
    @NotNull(message = "操作人id不能为空，请检查operatorId参数", groups = {add.class, edit.class})
    private Integer operatorId;

    /**
     * 省
     */
    @NotBlank(message = "省不能为空，请检查province参数", groups = {add.class, edit.class})
    private String province;

    /**
     * 市
     */
    @NotBlank(message = "市不能为空，请检查city参数", groups = {add.class, edit.class})
    private String city;

    /**
     * 县
     */
    @NotBlank(message = "县不能为空，请检查county参数", groups = {add.class, edit.class})
    private String county;

    /**
     * 集控中心
     */
    @NotBlank(message = "集控中心不能为空，请检查controlCenter参数", groups = {add.class, edit.class})
    private String controlCenter;

    /**
     * 变电站名称
     */
    @NotBlank(message = "变电站名称不能为空，请检查stationName参数", groups = {add.class, edit.class})
    private String stationName;

    /**
     * 电压等级
     */
    @NotBlank(message = "电压等级不能为空，请检查voltageLevel参数", groups = {add.class, edit.class})
    private String voltageLevel;

    /**
     * 照片
     */
    @NotBlank(message = "照片不能为空，请检查photo参数", groups = {add.class, edit.class})
    private String photo;

}
