package com.umar.recruiter.service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umar.recruiter.candidateRepo.CandidateRepository;
import com.umar.recruiter.entity.Candidate;
import com.umar.recruiter.entity.Company;
import com.umar.recruiter.entity.Manager;
import com.umar.recruiter.entity.Position;
import com.umar.recruiter.positonRepo.CompanyRepository;
import com.umar.recruiter.positonRepo.ManagerRepository;
import com.umar.recruiter.positonRepo.PositionRepository;

@Service
public class RecruiterService {
	@Autowired
	private CandidateRepository candidateRepository;

	@Autowired
	private PositionRepository positionRepository;

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private ManagerRepository managerRepository;

	public void saveCandidate(Candidate candidate) {
		candidateRepository.save(candidate);
	}

	public List<Candidate> searchCandidates(String name, String qualification, String designation, String position) {
		return candidateRepository
				.findByNameContainingIgnoreCaseOrQualificationContainingIgnoreCaseOrDesignationContainingIgnoreCaseOrPosition_PositionNameContainingIgnoreCase(
						name, qualification, designation, position);
	}

	public Position savePosition(Long companyId, Long managerId, String positionName, String jobDescription) {
		Position position = new Position();
		position.setCompany(companyRepository.findById(companyId).orElse(null));
		position.setManager(managerRepository.findById(managerId).orElse(null));
		position.setPositionName(positionName);
		position.setJobDescription(jobDescription);
		position.setStatus("Active");

		Position save = positionRepository.save(position);
		return save;
	}

	public List<Company> getAllCompanies() {
		return companyRepository.findAll();
	}

	public List<Manager> getAllManagers() {
		return managerRepository.findAll();
	}

	public void updatePosition(Position position) {
		Position position2 = this.getPosition(position.getId());
		if (position != null) {
			if (position.getName() != null) {
				position2.setName(position.getName());
			}
			if (position.getCompany() != null) {
				position2.setCompany(position.getCompany());
			}
			if (position.getManager() != null) {
				position2.setManager(position.getManager());
			}
			if (position.getPositionName() != null) {
				position2.setPositionName(position.getPositionName());
			}
			if (position.getJobDescription() != null) {
				position2.setJobDescription(position.getJobDescription());
			}
			if (position.getStatus() != null) {
				position2.setStatus(position.getStatus());
			}

		}
		positionRepository.save(position2);
	}

	public List<Position> getAllPositions() {
		return positionRepository.findAll();
	}

	public void deletePosition(Long id) {
		List<Candidate> candidates = candidateRepository.findByPositionId(id);
		for (Candidate candidate : candidates) {
			candidate.setPosition(null);
			candidateRepository.save(candidate);
		}

		positionRepository.deleteById(id);
	}

	public Position getPosition(Long id) {
		Position position = positionRepository.findById(id).orElseThrow();
		return position;
	}

	public Candidate getCandidateById(Long id) {
		return candidateRepository.findById(id).orElse(null);
	}

	public void updatePositionStatus(Long id, String status) {
		Position position = positionRepository.findById(id).orElseThrow();

		position.setStatus(status);
		positionRepository.save(position);
	}

	public byte[] exportCandidatesToExcel(List<Candidate> candidates) {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Candidates Details");

		Row headerRow = sheet.createRow(0);
		String[] headers = { "Name", "Qualification", "Designation", "Position" };
		for (int i = 0; i < headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		for (int i = 0; i < candidates.size(); i++) {
			Candidate candidate = candidates.get(i);
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(candidate.getName());
			row.createCell(1).setCellValue(candidate.getQualification());
			row.createCell(2).setCellValue(candidate.getDesignation());
			if (candidate.getPosition() != null) {
				row.createCell(3).setCellValue(candidate.getPosition().getPositionName());
			
			} else {
				row.createCell(3).setCellValue("NoPosition");
			}
		}

		try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
			workbook.write(outputStream);
			return outputStream.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
