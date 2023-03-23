package gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import convertidorDivisasV2.Conexion;

import java.awt.FlowLayout;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JComboBox;
import javax.swing.JTextField;
import javax.swing.JButton;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.event.MouseEvent;
import javax.swing.UIManager;

public class VentanaConvertidorDivisas extends JFrame implements ActionListener{

	private JPanel panelPrincipal;
	private JTextField txtCantidad1;
	private JTextField txtCantidad2;
	
	private JComboBox cbDivisas1;
	private JComboBox cbDivisas2;
	
	private JButton btnCalcular;
	//private tasaCambio;
	
	Conexion conexion = new Conexion();
	Connection cn = null;
	Statement stm = null;
	ResultSet rs = null;
	private JLabel lblNotificacion;

	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					VentanaConvertidorDivisas frame = new VentanaConvertidorDivisas();
//					frame.setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the frame.
	 */
	public VentanaConvertidorDivisas() {
		setTitle("Convertidor de divisas v2");

		inicializar();
		poblarComboBox();
	}



	private void inicializar() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 774, 410);
		panelPrincipal = new JPanel();
		panelPrincipal.setBackground(new Color(204, 255, 255));
		panelPrincipal.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(panelPrincipal);
		panelPrincipal.setLayout(null);
		
		JLabel lblDivisa1 = new JLabel("*Divisa 1");
		lblDivisa1.setToolTipText("Divisa origen");
		lblDivisa1.setBounds(10, 69, 200, 13);
		panelPrincipal.add(lblDivisa1);
		
		cbDivisas1 = new JComboBox();
		cbDivisas1.setBackground(new Color(255, 255, 204));
		cbDivisas1.setToolTipText("Selecciona una divisa");
		cbDivisas1.setBounds(10, 92, 200, 21);
		panelPrincipal.add(cbDivisas1);
		
		JLabel lblCantidad1 = new JLabel("*Cantidad");
		lblCantidad1.setBounds(224, 69, 92, 13);
		panelPrincipal.add(lblCantidad1);
		
		txtCantidad1 = new JTextField();
		txtCantidad1.setBackground(new Color(255, 255, 204));
		txtCantidad1.setToolTipText("Digita la cantidad");
		txtCantidad1.setBounds(220, 93, 96, 19);
		panelPrincipal.add(txtCantidad1);
		txtCantidad1.setColumns(10);
		
		JLabel lblDivisa2 = new JLabel("*Divisa 2");
		lblDivisa2.setToolTipText("Divisa origen");
		lblDivisa2.setBounds(431, 69, 200, 13);
		panelPrincipal.add(lblDivisa2);
		
		cbDivisas2 = new JComboBox();
		cbDivisas2.setBackground(new Color(204, 255, 204));
		cbDivisas2.setToolTipText("Selecciona una divisa");
		cbDivisas2.setBounds(431, 92, 200, 21);
		panelPrincipal.add(cbDivisas2);
		
		JLabel lblCantidad2 = new JLabel("*Cantidad");
		lblCantidad2.setBounds(645, 69, 92, 13);
		panelPrincipal.add(lblCantidad2);
		
		txtCantidad2 = new JTextField();
		txtCantidad2.setForeground(new Color(0, 0, 0));
		txtCantidad2.setBackground(new Color(0, 153, 0));
		txtCantidad2.setToolTipText("Aqui se visualiza el resultado");
		txtCantidad2.setColumns(10);
		txtCantidad2.setBounds(641, 93, 96, 19);
		txtCantidad2.setEnabled(false);
		panelPrincipal.add(txtCantidad2);
		
		btnCalcular = new JButton("Calcular");
		btnCalcular.setForeground(new Color(0, 0, 0));
		btnCalcular.setBackground(new Color(255, 255, 255));
		btnCalcular.setBounds(339, 170, 85, 21);
		panelPrincipal.add(btnCalcular);
		
		lblNotificacion = new JLabel("");
		lblNotificacion.setBounds(207, 261, 424, 67);
		lblNotificacion.setText("");
		panelPrincipal.add(lblNotificacion);
		btnCalcular.addActionListener(this);
		
		setLocationRelativeTo(null);		
	}
	
	
	private void poblarComboBox() {
		try {
			cn = conexion.conectar();
			stm = cn.createStatement();
			rs = stm.executeQuery("SELECT * FROM mysql.divisas;");
			
			while (rs.next()) {
				String idDivisa = rs.getString(1);
				String nombreDivisa = rs.getString(2);
				String paisDivisa = rs.getString(3);
				
				//System.out.println(idDivisa + " - " + nombreDivisa + " - " + paisDivisa);
				cbDivisas1.addItem(idDivisa + " - " + nombreDivisa);
				cbDivisas2.addItem(idDivisa + " - " + nombreDivisa);
				//System.out.println(idDivisa + " " + nombreDivisa + " " + paisDivisa);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				
				if (stm != null) {
					stm.close();
				}
				
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
	}



	@Override
	public void actionPerformed(ActionEvent e) {
		
		if (btnCalcular == e.getSource()) {
			
			if (validarCantidad1(txtCantidad1.getText())) {
				txtCantidad2.setText(String.valueOf(buscarTasaCambio(cbDivisas1.getSelectedItem().toString().substring(0, 3), txtCantidad1.getText(), cbDivisas2.getSelectedItem().toString().substring(0, 3))));
				//System.out.println(String.valueOf(buscarTasaCambio(cbDivisas1.getSelectedItem().toString(), txtCantidad1.getText(), cbDivisas2.getSelectedItem().toString())));				
			}
		}
	}



	private boolean validarCantidad1(String cantidad1) {
		try {
			Double.parseDouble(cantidad1) ;
			lblNotificacion.setText("");
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			lblNotificacion.setText("El campo Cantidad 1 no puede tener este valor: " + txtCantidad1.getText());

			return false;
		}
		//return false;
	}



	private String buscarTasaCambio(String divisa1, String cantidad1, String divisa2) {
		double tasa = 0;
		try {
			cn = conexion.conectar();
			stm = cn.createStatement();
			rs = stm.executeQuery("SELECT * FROM mysql.tasasdecambio WHERE idDivisa1 = '" + divisa1 + "' AND idDivisa2 = '" + divisa2 + "' limit 1;");
			//System.out.println("La tasa es: " + rs);
			//System.out.println("SELECT * FROM mysql.tasasdecambio WHERE idDivisa1 = '" + divisa1 + "' AND idDivisa2 = '" + divisa2 + "' limit 1;");

			while (rs.next()) {
				 tasa = rs.getDouble("tasasDeCambio");
				//System.out.println("LA TASA ES: " + tasa);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				
				if (stm != null) {
					stm.close();
				}
				
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return String.valueOf(Double.valueOf(cantidad1) * tasa);

	}	

}




