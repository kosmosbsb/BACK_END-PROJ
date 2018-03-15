package model.analysis;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class ExcelOuter {
	
	String filePath = "C:\\Users\\kosmo01\\Downloads";
	String excelName = "통계 데이터.xlsx";
	Map<String,String> headerList = new HashMap<String,String>();
	Map<String,String> list = new HashMap<String,String>();
	List<String> data = new Vector<String>();
	
	public void createExcelFile(String result) {
		
		String[] resultArr = result.split(",");
		
		//headerList를 세팅할 만큼 세팅합니다.
		for(int i=0 ; i <resultArr.length ; i++) {
			headerList.put(Integer.toString(i), (i+1)+"월");
		}
		
		data.add("");

		//XSSFWorkbook 세팅
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("sheet1");
		XSSFRow row = null;
		XSSFCell cell = null;

		for(int i=1; i<=data.size()+1; i++) {
			//data의 크기만큼 로우를 생성합니다.
			row=sheet.createRow((short)i);
			
			for(int k=1; k<headerList.size()+1; k++) {
				//headerList의 크기만큼 i번째 row에 cell을 생성합니다.
				cell=row.createCell(k);
				//맨윗줄에 headerList를 세팅합니다.
				if(i==1) {
					//CellStyle은 필요에따라서 세팅합니다.
					CellStyle style = workbook.createCellStyle();
					style.setFillForegroundColor(IndexedColors.BLUE.getIndex());
					//style.setFillPattern(FillPatternType.SQUARES);
					style.setAlignment(HorizontalAlignment.CENTER);
					style.setBorderBottom(BorderStyle.THIN);
					style.setBorderTop(BorderStyle.THIN);
					style.setBorderLeft(BorderStyle.THIN);
					style.setBorderRight(BorderStyle.THIN);
					cell.setCellStyle(style);
					//sheet.setColumnWidth(i,10);
					//headerList의 데이터를 세팅
					cell.setCellValue(headerList.get(Integer.toString(k-1)));
				} 
				//엑셀파일에 넣을 데이터를 세팅합니다.
				else {
					
					//CellStyle은 필요에따라서 세팅합니다.
					CellStyle style = workbook.createCellStyle();
					//style.setFillForegroundColor("셀color 세팅");
					//style.setFillPattern(FillPatternType.SQUARES);
					style.setAlignment(HorizontalAlignment.CENTER);
					style.setBorderBottom(BorderStyle.THIN);
					style.setBorderTop(BorderStyle.THIN);
					style.setBorderLeft(BorderStyle.THIN);
					style.setBorderRight(BorderStyle.THIN);
					cell.setCellStyle(style);
					
					
					
					//i-1을하는이유는 headerList가 i번쨰 row이기 때문.
					//<dataType> excelData = data.get(i-1); 
					//리스트의 크기만큼 세팅합니다.
					//list.put("-1", "123");
					list.put(Integer.toString(k),resultArr[k-1]);
					
					//cell.setCellValue(list.get("-1"));
					cell.setCellValue(list.get(Integer.toString(k)));
				}
			}
		}

		//엑셀파일 세팅 후 파일 생성
		try {
			File file = new File(filePath);
			//file을 생성할 폴더가 없으면 생성합니다.
			//file.mkdirs();

			FileOutputStream fileOutputStream = 
					new FileOutputStream(file+File.separator+excelName);

			//생성한 엑셀파일을 outputStream 해줍니다.
			workbook.write(fileOutputStream);
			fileOutputStream.close();
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
}
