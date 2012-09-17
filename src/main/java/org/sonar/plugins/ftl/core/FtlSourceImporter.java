/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.core;


import org.sonar.api.batch.AbstractSourceImporter;
import org.sonar.api.batch.Phase;

/**
 * Import of source files to sonar database.
 */
@Phase(name = Phase.Name.PRE)
public final class FtlSourceImporter extends AbstractSourceImporter {

  /**
   * Instantiates a new php source importer.
   */
  public FtlSourceImporter(Ftl ftl) {
    super(ftl);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public String toString() {
    return "Ftl Source Importer";
  }

}
