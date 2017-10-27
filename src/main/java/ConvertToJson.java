import com.google.gson.Gson;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by Commander Data on 10/27/2017.
 */
public class ConvertToJson
{
    public static void main(String[] args)
    {
        Record record = new Record();
        record.firstName = "Lord";
        record.lastName = "Lloyd";
        record.age = 55;

        Gson gson = new Gson();
        String json = gson.toJson(record); // Convert the object to a Json string.
        System.out.println(json);

        try(FileWriter writer = new FileWriter("tableTestData.txt"))
        {
            gson.toJson(record, writer);
        }
        catch(IOException exception)
        {
            exception.printStackTrace();
        }
    }
}
