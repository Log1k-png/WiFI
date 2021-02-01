import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.content.Context;
import android.app.Activity;

//ONLY EDIT THE 2 FUNCTIONS BELOW

void saveData(){
  //add what you want to save here :
  
  //saveVar(var, "key");


}

////////////////////////////////////////////////////////////////////////////////////////////////////////

void loadData(){//CALL THIS FUNCTION IN setup()
  //add what you want to load here :
  
  //var = loadType("key");
  

   
}



/////////////////////////////////////////////////////////////////
//////////////////DO NOT TOUCH FUNCTIONS BELOW///////////////////
/////////////////////////////////////////////////////////////////



public void saveVar(Object obj, String _key){
  
  SharedPreferences sharedPreferences;
  SharedPreferences.Editor editor;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  editor = sharedPreferences.edit();
  
  if (obj instanceof String){
    editor.putString(_key, (String) obj);
  }

  if (obj instanceof Integer){
    editor.putInt(_key, (int) obj);  
  }
    
  if (obj instanceof Float){
    editor.putFloat(_key, (float) obj);  
  }
    
  if (obj instanceof Boolean){
    editor.putBoolean(_key, (boolean) obj);
  }

  
  editor.commit();
  
}


 

int loadInt(String _key){
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  return sharedPreferences.getInt(_key, 0);
}

float loadFloat(String _key){
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  return sharedPreferences.getFloat(_key, 0);
}

boolean loadBoolean(String _key){
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  return sharedPreferences.getBoolean(_key, false);
}
 
String loadString(String _key){
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  return sharedPreferences.getString(_key, "");
}


void onPause(){
  super.onPause();
  saveData();
}
