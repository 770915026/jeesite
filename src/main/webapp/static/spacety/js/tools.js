var $el = {
    aside: $('.wrap-orgin'),
    tab: $('.tab-list')
}


// 侧边栏
function asideShow() {
    $el.aside.addClass('open');
}

function asideHide() {
    $el.aside.removeClass('open');
}

function tabToggle() {
    $el.tab.each(function (e) {
        var that = $(this);
        var outer = that.width() - 32;
        var s = 0;
        var ul2 = that.find('.list2');
        var li = that.find('.list li');
        var liNum = li.length;
        that.find('.omit').removeClass('hide');
        for (var i = 0; i < liNum; i++) {
            $(li[i]).removeClass('show')
            s += $(li[i]).width();
            if (s <= outer) {
                $(li[i]).addClass('show');
                if (i == liNum) {
                    that.find('.omit').addClass('hide');
                }
            } else {
                ul2.append($(li[i]));
            }
        }
        that.off('click').on('click', '.omit', function () {
            that.toggleClass('open');
        }).on('click', '.list li, .list2 li', function () {
            that.find('.on').removeClass('on');
            $(this).addClass('on');
            that.removeClass('open').find('.list').prepend(this);
            try {
                that.remove($(this));
            } catch (e) {
            }
            tabToggle();
        }).on('click', function () {
            return false;
        });

        $('body').on('click', function () {
            that.removeClass('open');
        })
    })
}


// svg环形进度条
/**
 * 传入相应参数返回圆形制定半径的弧度坐标
 * @param {*} x 中心点X坐标
 * @param {*} y 中心点y坐标
 * @param {*} R 圆半径
 * @param {*} a 角度
 */
function coordMap(x, y, R, a) {
    var ta = (360 - a) * Math.PI / 180,
        tx, ty;
    tx = R * Math.cos(ta); // 角度邻边
    ty = R * Math.sin(ta); // 角度的对边
    return {
        x: x + tx,
        y: y - ty // 注意此处是“-”号，因为我们要得到的Y是相对于（0,0）而言的。
    }
}

/**
 * 创建弧线
 * @param {*} data.startAngle 开始角度
 * @param {*} data.endAngle 结束角度
 * @param {*} data.R 圆半径
 * @param {*} data.x 中心点X坐标
 * @param {*} data.y 中心点y坐标
 * @param {*} data.color 边框颜色  默认#CCC
 * @param {*} data.strokeWidth 边框宽度 默认1
 * @param {*} data.strokelinecap 不同类型的路径的开始结束点 可选值 butt round square  默认butt
 * @param {*} data.strokeDasharray 虚线设置 它是一个<length>和<percentage>数列，数与数之间用逗号或者
 * 空白隔开，指定短划线和缺口的长度。如果提供了奇数个值，则这个值的数列重复一次，从而变成偶数个值。因此，5,3,2等同于5,3,2,5,3,2。
 * @param {*} data.transform CSS3旋转设置
 */
function drawSVG(data) {
    var path,
        // 起点坐标
        s = new coordMap(data.x, data.y, data.R, data.startAngle),
        // 结束坐标
        e = new coordMap(data.x, data.y, data.R, data.endAngle),
        // 创建弧线路径
        tpath = document.createElementNS("http://www.w3.org/2000/svg", "path");
    // 画一段到(x,y)的椭圆弧. 椭圆弧的 x, y 轴半径分别为 rx,ry. 椭圆相对于 x 轴旋转 x-axis-rotation 度. large-arc=0表明弧线小于180读, large-arc=1表示弧线大于180度. sweep=0表明弧线逆时针旋转, sweep=1表明弧线顺时间旋转.
    // svg : [A | a] (rx ry x-axis-rotation large-arc-flag sweep-flag x y)+
    path = 'M' + s.x + ',' + s.y + 'A' + data.R + ',' + data.R + ',0,' + (+(data.endAngle - data.startAngle > 180)) + ',1,' + e.x + ',' + e.y;
    // 设置路径
    tpath.setAttribute('d', path);
    // 去掉填充
    tpath.setAttribute("fill", "none");
    // 设置颜色
    if (data.color) {
        stroke = "url(#" + data.color + ")"
    } else {
        stroke = '#0F183A'
    }
    tpath.setAttribute('stroke', stroke);
    // 边线宽度
    tpath.setAttribute('stroke-width', data.strokeWidth || 1);
    data.strokelinecap ? tpath.setAttribute('stroke-linecap', data.strokelinecap) : '';
    data.strokeDasharray ? tpath.setAttribute('stroke-dasharray', data.strokeDasharray) : '';
    data.transform ? tpath.setAttribute('transform', data.transform) : '';
    return tpath;
}

/**
 * 画进度条
 * @param {*} $select  容器
 * @param {*} size 多少步 共100步
 */
function svgView($select, size1, size2) {
    // 创建SVG
    svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    svg.setAttribute("version", "1.1"); // IE9+ support SVG 1.1 version
    svg.setAttribute("width", "140px");
    svg.setAttribute("height", "140px");
    // 画底线并加入SVG中
    svg.appendChild(new drawSVG({
        startAngle: 51,
        endAngle: 309,
        x: 70,
        y: 70,
        R: 65,
        strokeWidth: 5,
        transform: 'rotate(-270, 70, 70)'
    }));
    svg.appendChild(new drawSVG({
        startAngle: 40,
        endAngle: 320,
        x: 70,
        y: 70,
        R: 52,
        strokeWidth: 5,
        transform: 'rotate(-270, 70, 70)'
    }));
    var step1 = (309 - 51) / 100;
    var step2 = (320 - 40) / 100;
    // 画进度并加入SVG中
    svg.appendChild(new drawSVG({
        startAngle: 51,
        endAngle: 51 + size1 * step1,
        x: 70,
        y: 70,
        R: 65,
        color: 'SVGID_3',
        strokeWidth: 5,
        transform: 'rotate(-270, 70, 70)'
    }));
    svg.appendChild(new drawSVG({
        startAngle: 40,
        endAngle: 40 + size2 * step2,
        x: 70,
        y: 70,
        R: 52,
        color: 'SVGID_4',
        strokeWidth: 5,
        transform: 'rotate(-270, 70, 70)'
    }));
    // 写入页面
    document.querySelector($select).appendChild(svg);
}


/**
 * 格式化时间
 *
 * @param  {time} 时间
 * @param  {cFormat} 格式
 * @return {String} 字符串
 *
 * @example formatTime('2018-1-29', '{y}/{m}/{d} {h}:{i}:{s}') // -> 2018/01/29 00:00:00
 */
function formatTime(time, cFormat) {
    if (arguments.length === 0) return null
    if ((time + '').length === 10) {
        time = +time * 1000
    }

    var format = cFormat || '{y}-{m}-{d} {h}:{i}:{s}', date
    if (typeof time === 'object') {
        date = time
    } else {
        date = new Date(time)
    }

    var formatObj = {
        y: date.getFullYear(),
        m: date.getMonth() + 1,
        d: date.getDate(),
        h: date.getHours(),
        i: date.getMinutes(),
        s: date.getSeconds(),
        a: date.getDay()
    }
    var time_str = format.replace(/{(y|m|d|h|i|s|a)+}/g, function (result, key) {
        var value = formatObj[key]
        if (key === 'a') return ['一', '二', '三', '四', '五', '六', '日'][value - 1]
        if (result.length > 0 && value < 10) {
            value = '0' + value
        }
        return value || 0
    })
    return time_str
}








