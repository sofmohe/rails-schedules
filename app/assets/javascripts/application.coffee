#= require bootstrap-sprockets
#= require moment
#= require moment/ja
#= require bootstrap-datetimepicker


#$ ->
#  $('.datetimepicker').datetimepicker()
computeDate = (year, month, day, addDays) ->
  dt = new Date(year, month - 1, day)
  baseSec = dt.getTime()
  addSec = addDays * 86400000
  #日数 * 1日のミリ秒数
  targetSec = baseSec + addSec
  dt.setTime targetSec
  dt

$ ->
  $('.datepicker1').datepicker().on 'changeDate', (e) ->
    #開始日が選択されたら
    $('.datepicker2').datepicker 'show'
    #終了日のカレンダーを表示
    selected_date = e['date']
    #開始日のデータ取得
    yyyy = selected_date.getFullYear()
    mm = selected_date.getMonth() + 1
    dd = selected_date.getDate()
    sd = computeDate(yyyy, mm, dd, 0)
    #0000-00-00の形で指定日後が返ってくる
    $('.datepicker2').datepicker 'setStartDate', sd
    #start日より前の日を無効化する
    return
  return
