$(function() {
	var $if = $(".firstnav"); // 显示一级目录父元素对象
	var $is = $(".secondnav"); // 显示二级目录父元素对象
	var $iv = $(".valuenav"); // 显示三级目录父元素对象
	var $im = $("input[id='bg-model-update-input']"); // 更新的输入框对象
	var $id = $("input[id='bg-model-update-id']"); // 更新的id对象
	var $bmu = $(".bg-model-update"); // 更新模态框对象
	var $bma = $(".bg-model-add"); // 添加模态框对象
	var $tg = $(".target-div"); // 参考标志对象
	var $iadd = $("input[id='bg-model-add-id']"); // 添加的id对象
	var $nadd = $("input[id='bg-model-add-name']"); // 添加的所属对象。例如一级、二级、三级
	// -------------------------------------一级目录----------------------------------------
	var url = sys.contextPath + "/catalog.do";
	request.ajax(url, "", true, function(data) {
		console.log(data)
		$if.children().not(":first").remove();
		var ls = data.rows;
		for ( var i in ls) {
			$if.append('<li id="' + ls[i].cid + '">' + ls[i].cname + '</li>');
		}
	});
	// -------------------------------------二级目录----------------------------------------
	$if
			.on(
					'click',
					'li',
					function() {
						if ($if.children().index(this) == 0) {
							// 添加一级目录
							hide($bma);
							// 添加输入框
							var div = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">一级属性</div><input type="text" class="form-control bg-model-add-input"  name="value"></div><br/>';
							$tg.after($(div));
							// 添加标志
							$nadd.attr('name', 'catalog');
							return;
						}
						$iv.children().not(":first").remove();
						// =================================================
						var url1 = sys.contextPath + "/secondCatalog.do";
						param = {
							"cid" : this.id
						}; // 记录一级id
						request.ajax(url1, param, true, function(data) {
							$is.children().not(":first").remove();
							var ls = data.rows;
							for ( var i in ls) {
								$is.append('<li class="secondCatalog" id="'
										+ ls[i].scid + '">' + ls[i].scname
										+ '</li>');
							}
						});
					});
	// 双击编辑一级目录
	$if.on('dblclick', 'li', function() {
		hide($bmu);
		$im.val($(this).text());
		$id.val($(this).attr('id'));
		$id.attr('name', 'cid');
	});
	// -------------------------------------显示属性值--------------------------------------
	$is
			.on(
					'click',
					'li',
					function() {
						if ($is.children().index(this) == 0) {
							// 添加二级目录
							hide($bma);
							//
							var div1 = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">二级属性</div><input type="text" class="form-control bg-model-add-input"  name="value" readonly="readonly"></div><br/>';

							$tg.after($(div1));
							$iadd.attr('name', 'cid');
							$nadd.attr('name', 'secondcatalog');
							// 添加一级目录可供选择
							var div2 = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">一级目录</div><select class="input-sm form-control text-center" id="selectcatalog"></select></div><br/>';/* TODO */
							$tg.after($(div2));
							var $select = $('#selectcatalog');
							var url = sys.contextPath + "/catalog.do";
							request
									.ajax(
											url,
											"",
											true,
											function(data) {
												console.log(data)
												var ls = data.rows;
												$select
														.prepend("<option value='0'>--请选择--</option>");
												for ( var i in ls) {
													$select
															.append('<option value="'
																	+ ls[i].cid
																	+ '">'
																	+ ls[i].cname
																	+ '</option>');
												}
												console.log($select)
											});
							return;
						}
						var url2 = sys.contextPath + "/secondValue.do";
						param["sid"] = this.id; // 记录二级id
						request.ajax(url2, param, true, function(data) {
							$iv.children().not(":first").remove();
							var ls = data.rows;
							for ( var i in ls) {
								$iv.append('<li class="secondValue" id="'
										+ ls[i].attrid + '">' + ls[i].value
										+ '</li>');
							}
						});
					});
	// 双击编辑二级目录
	$is.on('dblclick', 'li', function() {
		hide($bmu);
		$im.val($(this).text());
		$id.val($(this).attr('id'));
		$id.attr('name', 'sid');
	});
	//
	$iv
			.on(
					'click',
					'li',
					function() {
						if ($iv.children().index(this) == 0) {
							// 添加二级目录
							hide($bma);
							//
							var html1 = '<div class="input-group-addon">一级目录</div><input type ="text" class="form-control" id="bg-model-update-input"  name="value">';
							$(".bg-model-add-first").append(html1);
							var html2 = '<div class="input-group-addon">二级目录</div><input type ="text" class="form-control" id="bg-model-update-input"  name="value">';
							$(".bg-model-add-second").append(html2);
							// alert(3);
							// 记录当前操作对象
							$iadd.attr('name', 'sid');
							$nadd.attr('name', 'secondvalue');
							// 添加选择、输入框
							var div1 = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">三级属性</div><input type="text" class="form-control bg-model-add-input"  name="value" readonly="readonly"></div><br/>';
							$tg.after($(div1));
							var div2 = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">二级目录</div><select class="input-sm form-control text-center" id="selectsecondcatalog"></select></div><br/>';/* TODO */
							$tg.after($(div2));
							// 添加一级目录可供选择
							var div3 = '<div class="input-group bg-model-add-value"><div class="input-group-addon bg-model-add-label">一级目录</div><select class="input-sm form-control text-center" id="selectcatalog"></select></div><br/>';/* TODO */
							$tg.after($(div3));
							var $select = $('#selectcatalog');
							var url = sys.contextPath + "/catalog.do";
							request
									.ajax(
											url,
											"",
											true,
											function(data) {
												var ls = data.rows;
												$select
														.prepend("<option value='0'>--请选择--</option>");
												for ( var i in ls) {
													$select
															.append('<option value="'
																	+ ls[i].cid
																	+ '">'
																	+ ls[i].cname
																	+ '</option>');
												}
											});
							return;
						}
					});
	// 双击编辑三级目录
	$iv.on('dblclick', 'li', function() {
		hide($bmu);
		$im.val($(this).text());
		$id.val($(this).attr('id'));
		$id.attr('name', 'attrid');
	});

	// 关闭模态框
	function close() {
		$bmu.hide(); // 隐藏更新模态框
		$bma.hide(); // 隐藏添加模态框
		// 清除隐藏表单数据
		$iadd.removeAttr("name");
		$iadd.removeAttr("value");
		$nadd.removeAttr("name");

		$(".input-group").remove(); // 移除添加模态框中的组件
		$(".form-group").find("br").remove(); // 移除添加模态框中的br组件
		// 显示窗体的滚动条
		$("body").css({
			"overflow" : "visible"
		});
	}
	// 隐藏
	function hide(self) {
		self.fadeTo(300, 1);
		// 隐藏窗体的滚动条
		$("body").css({
			"overflow" : "hidden"
		});
	}
	// 添加模态框移除上一次操作记录
	function addRemove() {
		$("#selectsecondcatalog").children().remove();
		$(".bg-model-add-input").attr("readonly", "readonly");
		$iadd.removeAttr("value");
	}
	// 更新目录内容
	$(".bg-model-update-cancel").click(close);
	$(".bg-model-update-ok").click(
			function() {
				var url = sys.contextPath
						+ "/admins/updateCategories";
				var params = {};
				params[$im.attr('name')] = $im.val();
				params[$id.attr('name')] = $id.val();
				request.ajax(url, params, true, function(data) {
					if (data.success) {
						window.location.href = sys.contextPath
								+ "/admins/categorieslist";
					} else {
						// alert("更新失败")
					}
				});
				close();
			});
	// 添加目录元素
	$(".bg-model-add-ok")
			.click(
					function() {
						// 获取输入框内容
						var $self = $(".bg-model-add-input");
						var params = {};
						params[$self.attr("name")] = $self.val();
						// 判断操作的对象
						var url1 = "";
						var $temp;
						var goal = $nadd.attr('name');
						if (goal == "catalog") {
							url1 = sys.contextPath
									+ "/admins/addCatalog";
							$temp = $if;
						} else if (goal == "secondcatalog") {
							url1 = sys.contextPath
									+ "/admins/addSecondCatalog";
							params[$iadd.attr("name")] = $iadd.val();
							$temp = $is;
						} else {
							url1 = sys.contextPath
									+ "/admins/addSecondValue";
							params[$iadd.attr("name")] = $iadd.val();
							$temp = $iv;
						}
						request.ajax(url1, params, true, function(data) {
							$temp.children().not(":first").remove();
							console.log($temp);
							var ls = data.rows;
							if ($temp == $if) { // 添加一级目录操作
								for ( var i in ls) {
									$temp.append('<li id="' + ls[i].cid + '">'
											+ ls[i].cname + '</li>');
								}
							} else if ($temp == $is) { // 添加二级目录操作
								for ( var i in ls) {
									$temp.append('<li id="' + ls[i].scid + '">'
											+ ls[i].scname + '</li>');
								}
							} else { // 添加三级目录操作
								for ( var i in ls) {
									$temp.append('<li id="' + ls[i].attrid
											+ '">' + ls[i].value + '</li>');
								}
							}
						});
						close(); // 隐藏模态框
					});
	// 一级目录下拉框选择事件
	$(document).on(
			"change",
			"#selectcatalog",
			function() {
				var value = $(this).children('option:selected').val();
				if (value == 0) {
					addRemove();
					return;
				}
				if ($nadd.attr('name') == "secondcatalog") {
					// 添加二级目录时，添加输入框可编辑
					$(".bg-model-add-input").removeAttr("readonly");
					$iadd.val(value);
				} else {
					// 添加三级目录时，获取二级目录信息
					var url1 = sys.contextPath + "/secondCatalog.do";
					var params = {
						"cid" : value
					};
					request.ajax(url1, params, true, function(data) {
						var $select = $("#selectsecondcatalog");
						// 移除上一次记录
						addRemove();
						// 加载新的信息
						var ls = data.rows;
						$select.prepend("<option value='0'>--请选择--</option>");
						for ( var i in ls) {
							$select.append('<option value="' + ls[i].scid
									+ '">' + ls[i].scname + '</option>');
						}
					});
				}
			});
	// 二级目录下拉框选择事件
	$(document).on("change", "#selectsecondcatalog", function() {
		var value = $(this).children('option:selected').val();
		if (value == 0) {
			$(".bg-model-add-input").attr("readonly", "readonly");
			return;
		}
		// 添加三级级目录时，添加输入框可编辑
		$(".bg-model-add-input").removeAttr("readonly");
		$iadd.val(value);
	});

});