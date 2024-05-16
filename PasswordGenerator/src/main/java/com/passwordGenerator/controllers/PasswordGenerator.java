
package com.passwordGenerator.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PasswordGenerator 
{
	StringBuilder sb ;
	@RequestMapping("/")
	public ModelAndView homepage()
	{
		ModelAndView mv = new ModelAndView();
		sb=new StringBuilder("");
		mv.addObject("password", sb);
        mv.setViewName("password_generator.jsp");
		return mv;
	}
	@RequestMapping("/generatePassword")
	public ModelAndView generate(
            @RequestParam(name = "uppercaseChecked", defaultValue = "false") boolean uppercaseChecked,
            @RequestParam(name = "lowercaseChecked", defaultValue = "false") boolean lowercaseChecked,
            @RequestParam(name = "numbersChecked", defaultValue = "false") boolean numbersChecked,
            @RequestParam(name = "symbolsChecked", defaultValue = "false") boolean symbolsChecked,
            @RequestParam(name = "charCount", defaultValue = "8") int charCount) {
		 
		StringBuilder generatedPassword = new StringBuilder("");
		String UPPERCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
     	String LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz";
	    String NUMBERS = "1234567890";
	    String SYMBOLS = "!@#$%^&*()-_=+\\/~?";
	    StringBuilder pool = new StringBuilder();
	    if(uppercaseChecked)
	    pool.append(UPPERCASE_LETTERS);
	    if(lowercaseChecked)
	    pool.append(LOWERCASE_LETTERS);
	    if(numbersChecked)
	    pool.append(NUMBERS);
	    if(symbolsChecked)
	    pool.append(SYMBOLS);
        int alphabetLength = pool.length();
        int max = alphabetLength - 1;
        int min = 0;
        int range = max - min + 1;
        for (int i = 0; i < charCount; i++) {
            int index = (int) (Math.random() * range) + min;
            generatedPassword.append(pool.charAt(index));
        }
        sb = new StringBuilder("");
        sb.append(generatedPassword);
        ModelAndView mv = new ModelAndView();
        mv.addObject("password", sb);
        mv.setViewName("password_generator.jsp");
        return mv;
    }
	

}

