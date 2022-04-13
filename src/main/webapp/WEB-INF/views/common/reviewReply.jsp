<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${reviewReply}" var="dto">
	<tr class="bgg">
		<td id="up${dto.replyNum}">
			<div style="font-size: medium; white-space:pre-wrap"><c:out value="${dto.contents}" /></div>
		</td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.writer}</td>

        <td>
            <c:if test="${member.id eq dto.writer}">

                <button class="update site-btn" type="button" data-index="${dto.replyNum}">UPDATE</button>
                <button class="delete site-btn" type="button" data-num="${dto.replyNum}">DELETE</button>
            </c:if>

        </td>
	</tr>
</c:forEach>