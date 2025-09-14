/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.wolfbear.skeleton.api;

import com.wolfbear.skeleton.contract.api.CustomersApi;
import com.wolfbear.skeleton.contract.model.Customer;
import com.wolfbear.skeleton.services.CustomersService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author wolfbear
 */
@RestController
public class CustomersApiImpl implements CustomersApi {

  private final CustomersService customersService;

  public CustomersApiImpl(CustomersService customersService) {
    this.customersService = customersService;
  }

  @Override
  public ResponseEntity<List<Customer>> listCustomers() {
    List<Customer> list = new ArrayList<>();
    return ResponseEntity.ok(list);
  }
}
