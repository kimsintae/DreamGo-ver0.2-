<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            <div class="col-sm-3 sidenav">
                <h4>관리자페이지</h4>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="${pageContext.request.contextPath}/admin/board/1">게시글</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/users/1">회원관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/report/1">신고관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/replies/1">댓글관리</a></li>
                </ul>
                <br>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search Blog..">
                    <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
                    </button>
                    </span>
                </div>
            </div>