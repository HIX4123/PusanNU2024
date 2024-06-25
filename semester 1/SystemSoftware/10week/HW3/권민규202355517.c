#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 1000

typedef struct {
  char name[MAX_LINE_LENGTH];
  int num_args;
  char content[MAX_LINE_LENGTH];
} Macro;

Macro *extractMacro(const char *filename);
Macro saveMacroNames(const char *macro_name, int num_args);
void printMacros(const Macro *macros, int num_macros);
void removeMacroDefinitions(const char *filename);
void replaceMacros(Macro *macros, int num_macros, const char *inputfile,
                   const char *outputfile);

int main() {
  Macro *macros = extractMacro("w.asm");
  // printMacros(macros, 2);
  removeMacroDefinitions("w.asm");
  replaceMacros(macros, 2, "tmp.asm", "w.tmp");
  free(macros);
  return 0;
}

Macro *extractMacro(const char *filename) {
  FILE *file = fopen(filename, "r");
  if (file == NULL) {
    printf("파일을 열 수 없습니다.\n");
    return NULL;
  }

  char line[MAX_LINE_LENGTH];
  const char *macro_start = "%macro";
  const char *macro_end = "%endmacro";
  int num_macros = 0;
  Macro *macros = NULL;

  while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
    if (strncmp(line, macro_start, strlen(macro_start)) == 0) {
      char *macro_name = line + strlen(macro_start);
      while (*macro_name == ' ' || *macro_name == '\t') {
        macro_name++;
      }

      char *end_of_macro_name = strpbrk(macro_name, " \t");
      if (end_of_macro_name == NULL) {
        end_of_macro_name = strchr(macro_name, '\t');
      }

      int macro_name_length = end_of_macro_name - macro_name;
      char extracted_macro_name[MAX_LINE_LENGTH];
      strncpy(extracted_macro_name, macro_name, macro_name_length);
      extracted_macro_name[macro_name_length] = '\0';

      int num_args = 0;
      char *arg = end_of_macro_name;
      while (*arg != '\0') {
        if (*arg >= '0' && *arg <= '9') {
          num_args = num_args * 10 + (*arg - '0');
        }
        arg++;
      }

      Macro macro = saveMacroNames(extracted_macro_name, num_args);
      while (fgets(line, MAX_LINE_LENGTH, file) != NULL &&
             strncmp(line, macro_end, strlen(macro_end)) != 0) {
        strcat(macro.content, line);
        if (strlen(macro.content) > MAX_LINE_LENGTH) {
          printf("매크로가 너무 길어서 저장할 수 없습니다.\n");
          break;
        }
      }

      macros = realloc(macros, (num_macros + 1) * sizeof(Macro));
      macros[num_macros] = macro;
      num_macros++;
    }
  }

  fclose(file);
  return macros;
}

Macro saveMacroNames(const char *macro_name, int num_args) {
  Macro macro;
  strcpy(macro.name, macro_name);
  macro.num_args = num_args;
  macro.content[0] = '\0';
  return macro;
}

void removeMacroDefinitions(const char *filename) {
  FILE *file = fopen(filename, "r");
  FILE *output = fopen("tmp.asm", "w");
  if (file == NULL) {
    printf("파일을 열 수 없습니다.\n");
    return;
  }

  char line[MAX_LINE_LENGTH];
  const char *macro_start = "%macro";
  const char *macro_end = "%endmacro";
  int in_macro = 0;
  while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
    if (strncmp(line, macro_start, strlen(macro_start)) == 0) {
      in_macro = 1;
    } else if (strncmp(line, macro_end, strlen(macro_end)) == 0) {
      in_macro = 0;
      fgets(line, MAX_LINE_LENGTH, file);
    } else if (!in_macro) {
      fprintf(output, "%s", line);
    }
  }

  fclose(file);
  fclose(output);
}

void replaceMacros(Macro *macros, int num_macros, const char *filename,
                   const char *outputfile) {
  FILE *file = fopen(filename, "r");
  FILE *output = fopen(outputfile, "w");
  if (file == NULL) {
    printf("파일을 열 수 없습니다.\n");
    return;
  }

  char line[MAX_LINE_LENGTH];
  while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
    int macro_found = 0;
    for (int i = 0; i < num_macros; i++) {
      if (strstr(line, macros[i].name) != NULL) {
        macro_found = 1;
        char *parameters[MAX_LINE_LENGTH];
        int num_parameters = 0;
        printf("line: %s\n", line);
        char *token = strtok(line, " ");
        token += strlen(macros[i].name) + 3;
        while (token != NULL) {
          parameters[num_parameters] = token;
          num_parameters++;
          token = strtok(NULL, " ");
        }
        printf("Number of parameters: %d\n", num_parameters);
        printf("number of args: %d\n", macros[i].num_args);
        for (int j = 0; j < num_parameters; j++) {
          printf("Parameter %d: %s\n", j, parameters[j]);
        }
        printf("done\n");

        token = strtok(macros[i].content, " ");
        while (token != NULL) {
          if (token[0] == '%' && token[1] >= '1' && token[1] <= '9') {
            int parameter_index = token[1] - '1';
            fprintf(output, " %s", parameters[parameter_index]);
          } else {
            fprintf(output, " %s", token);
          }
          token = strtok(NULL, " ");
        }
        break;
      }
    }
    if (!macro_found) {
      fprintf(output, "%s", line);
    }
  }

  fclose(file);
  fclose(output);
}

void printMacros(const Macro *macros, int num_macros) {
  for (int i = 0; i < num_macros; i++) {
    printf("Macro Name: %s\n", macros[i].name);
    printf("Argements: %d\n", macros[i].num_args);
    printf("Content: %s\n", macros[i].content);
  }
}
