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
package com.mch.modular.station.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.mch.core.pojo.base.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.*;
import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * 变电站基本信息
 *
 * @author mach
 * @date 2021-08-27 09:48:02
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("info_station")
public class Station extends BaseEntity {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 唯一资源id
     */
    @Excel(name = "唯一资源id")
    private String objid;

    /**
     * 创建时间
     */
    @Excel(name = "创建时间", databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd", width = 20)
    private Date cdate;

    /**
     * 操作人
     */
    @Excel(name = "操作人")
    private String operator;

    /**
     * 操作人id
     */
    @Excel(name = "操作人id")
    private Integer operatorId;

    /**
     * 省
     */
    @Excel(name = "省")
    private String province;

    /**
     * 市
     */
    @Excel(name = "市")
    private String city;

    /**
     * 县
     */
    @Excel(name = "县")
    private String county;

    /**
     * 集控中心
     */
    @Excel(name = "集控中心")
    private String controlCenter;

    /**
     * 变电站名称
     */
    @Excel(name = "变电站名称")
    private String stationName;

    /**
     * 电压等级
     */
    @Excel(name = "电压等级")
    private String voltageLevel;

    /**
     * 照片
     */
    @Excel(name = "照片")
    private String photo;

}
