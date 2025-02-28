package Reto;
import java.util.Scanner;

public class Reto {
    static String[] usuarios = new String[100];
    static String[] users = new String[100];
    static String[] passwords = new String[100];
    static String[] eventos = new String[100];
    static int[][] inscripciones = new int[100][100];
    static int numUsuarios = 0;
    static int numEventos = 0;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion;
        do {
            System.out.println("1. Registrar usuario");
            System.out.println("2. Crear evento");
            System.out.println("3. Inscribirse en evento");
            System.out.println("4. Mostrar usuarios y eventos");
            System.out.println("5. Salir");
            System.out.print("Seleccione una opción: ");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1:
                    registrarUsuario(sc);
                    break;
                case 2:
                    crearEvento(sc);
                    break;
                case 3:
                    inscribirseEvento(sc);
                    break;
                case 4:
                    mostrarDatos();
                    break;
                case 5:
                    System.out.println("Saliendo...");
                    break;
                default:
                    System.out.println("Opción no válida");
            }
        } while (opcion != 5);
        sc.close();
    }

    static void registrarUsuario(Scanner scanner) {
        if (numUsuarios < 100) {
            System.out.print("Nombre: ");
            usuarios[numUsuarios] = scanner.nextLine();
            System.out.print("Usuario: ");
            users[numUsuarios] = scanner.nextLine();
            System.out.print("Contraseña: ");
            passwords[numUsuarios] = scanner.nextLine();
            numUsuarios++;
            System.out.println("Usuario registrado.");
        } else {
            System.out.println("No hay espacio para más usuarios.");
        }
    }

    static void crearEvento(Scanner sc) {
        if (numEventos < 100) {
            System.out.print("Nombre del evento: ");
            eventos[numEventos] = sc.nextLine();
            numEventos++;
            System.out.println("Evento creado.");
        } else {
            System.out.println("No hay espacio para más eventos.");
        }
    }

    static void inscribirseEvento(Scanner sc) {
        System.out.print("Ingrese su usuario: ");
        String user = sc.nextLine();
        int usuarioIndex = -1;
        for (int i = 0; i < numUsuarios; i++) {
            if (users[i].equals(user)) {
                usuarioIndex = i;
                break;
            }
        }
        if (usuarioIndex == -1) {
            System.out.println("Usuario no encontrado.");
            return;
        }
        System.out.print("Ingrese el número del evento (0 a " + (numEventos - 1) + "): ");
        int eventoIndex = sc.nextInt();
        if (eventoIndex >= 0 && eventoIndex < numEventos) {
            inscripciones[usuarioIndex][eventoIndex] = 1;
            System.out.println("Inscripción exitosa.");
        } else {
            System.out.println("Evento no válido.");
        }
    }

    static void mostrarDatos() {
        System.out.println("Usuarios registrados:");
        for (int i = 0; i < numUsuarios; i++) {
            int x=i+1;
        	System.out.println(x + ". " + usuarios[i] + " (" + users[i] + ")");
        }
        System.out.println("Eventos disponibles:");
        for (int i = 0; i < numEventos; i++) {
        	int x=i+1;
            System.out.println(x + ". " + eventos[i]);
        }
    }
}
