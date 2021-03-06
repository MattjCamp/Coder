
#' SQL JOIN
#'
#' @description SQL code to join table
#' @details Joins table to sql query
#' @keywords sql
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format that has SQL which selects records
#' @param table_to_join the table that you want to join to
#' @param by the SQL string criteria that joins the records (ie: X.a = Y.a)
#' @param sel.cols the columns from the supplied sql that you would like to select
#' @param join_type the type of join (ie: inner, left, right)
#' @export

code_sql_join <- function(sql, table_to_join, by, sel.cols = "*", join_type = "inner"){

  sql <- sql[1]

  if (join_type == "inner")
    join_type <- ""

  j <- sprintf("%s join %s Y on %s", join_type, table_to_join, by)

  sql <- code_sql_select(table_or_sql = sql,
                         select.cols = sel.cols,
                         joins = j,
                         alias = "X")

  sql

}
