<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Spring</title>
</head>
<body>
<script type="text/javascript">
	   			 function finalizaAgora(id) {
	     		 	$.post("finalizaTarefa",{'id' : id}, function(resposta){
	       		 	$("#tarefa_"+id).html("Finalizado");
	        		$("#data_"+id).html(resposta);
	     		 	});
	    		 }
	  		</script>
	  		
	<a href="novaTarefa">Criar nova tarefa</a>
	
			
	<table>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalizado?</th>
			<th>Data de finalização</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td id="tarefa_${tarefa.id}"><a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar</a></td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}"><td>Finalizado</td>
				</c:if>
				<td id="data_${tarefa.id}"><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
						pattern="dd/MM/yyyy" /></td>
			<td><a href="removeTarefa?id=${tarefa.id}">Remover tarefa</a></td>
			<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>