public class ConvertAllToString
{

    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Integer: '+ ConvertAllToString.ToString(13434)));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Double: '+ ConvertAllToString.ToString(1.23)));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Boolean: '+ ConvertAllToString.ToString(true)));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Date: ' + ConvertAllToString.ToString(date.newinstance(1960, 2, 17))));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Date time: ' + ConvertAllToString.ToString(Datetime.now(),'MMM, dd yyyy')));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'File Size: '+ ConvertAllToString.FileSizeToString(6766767)));
    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Money: '+ ConvertAllToString.CurrencyToString(Decimal.valueOf(34.99),'$'))
 
    public static String ToString(integer Value)
    {
        /* string representation if an Integer value */
        return Value.format();
    }
 
    public static String ToString(Double Value)
    {
        /* string representation if a Double value */
        return Value.format();
    }
 
    public static String ToString(Boolean Value)
    {
        /* string representation if a Boolean value */
        if (Value)
        return 'true';
        else
        return 'false';
    }
 
    public static String ToString(Long Value)
    {
        /* string representation if a Long value */
        return Value.format();
    }
 
    public static String ToString(Date Value)
    {
        /* string representation if a Date value */
        return Value.format();
    }
 
    public static String ToString(Date Value,String format)
    {
        /* string representation if a Date value with formatting */
        Datetime temp = Datetime.newInstance(Value.year(), Value.month(), Value.day());
        return temp.format(format);
    }
 
    public static String ToString(Datetime Value)
    {
        /* string representation if a Datetime value */
        return Value.format();
    }
 
    public static String ToString(Datetime Value,String format)
    {
        /* string representation if a Datetime value with formatting */
        return Value.format(format);
    }
 
    public static String ToString(Time Value)
    {
        /* string representation if a Time value */
        return String.valueOf(Value);
    }
 
    public static String ToString(Time Value, String format)
    {
        /* string representation if a Time value with formating */
        Datetime temp = Datetime.newInstance(1970, 1, 1, Value.hour(), Value.minute(), Value.second());
        return temp.format(format);
    }

    public static String ToString(Decimal Value)
    {
        /* string representation if a Decimal value */
        return Value.format();
    }
 
    public static String ToString(Decimal Value, Boolean ScientificNotation)
    {
        /* string representation if a Decimal value with or without Scientific Notation */
        if (ScientificNotation)
        return Value.format();
        else
        return Value.toPlainString();
    }
 
    public static String FileSizeToString(Long Value)
    {
        /* string representation if a file's size, such as 2 KB, 4.1 MB, etc */
        if (Value < 1024)
        return ToString(Value) + ' Bytes';
        else
        if (Value >= 1024 && Value < (1024*1024))
        {
            //KB
            Decimal kb = Decimal.valueOf(Value);
            kb = kb.divide(1024,2);
            return ToString(kb) + ' KB';
        }
        else
        if (Value >= (1024*1024) && Value < (1024*1024*1024))
        {
            //MB
            Decimal mb = Decimal.valueOf(Value);
            mb = mb.divide((1024*1024),2);
            return ToString(mb) + ' MB';
        }
        else
        {
            //GB
            Decimal gb = Decimal.valueOf(Value);
            gb = gb.divide((1024*1024*1024),2);
            return ToString(gb) + ' GB';
        }
    
    }
 
    public static String CurrencyToString(Decimal Value, String CurrencyChar)
    {
        return CurrencyChar + ToString(Value);
    }
 
}